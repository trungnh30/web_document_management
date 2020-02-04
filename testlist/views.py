import os
from django.shortcuts import render, redirect, get_object_or_404
from django.views import View
from .models import folder, document, CustomUser
from django.core.files.storage import FileSystemStorage
from django.contrib.auth.models import User
from .forms import UploadForm, Upload_miniForm
from datetime import datetime, timedelta, timezone
from django.contrib.auth import authenticate
from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from django.contrib.auth.decorators import login_required, permission_required, user_passes_test
from django.db.models import Q


class login(View):
    def post(self, request):
        return redirect('/')

    def get(self, request):
        return render(request, 'lo_gin.html')


class Home(View):
    '''

    '''
    template = 'Home.html'

    def get(self, request):
        # ROOT folder: ['STQT Chat luong', 'STQT Dao tao', ...]
        roots = folder.objects.exclude(parent_ID_id__isnull=False)
        context = {'roots': roots, 'child_root': {}}
        for f in roots:
            child_root = folder.objects.filter(parent_ID_id=f.id).values_list(
                'id', 'ten_Folder')  # child of root folder
            context['child_root'].update({f: child_root})

        print(context['child_root'])
        if not request.user.is_authenticated:
            return redirect('/accounts/login/')
        else:
            return render(request, self.template, context)


class document_others(View):
    '''
    Tài liệu cho tất cả các subfolder ở tất cả các STQT
    '''
    template = 'Documents_Others.html'

    def get(self, request, folder_id=None):
        # BASE
        roots = folder.objects.exclude(parent_ID_id__isnull=False)
        form = Upload_miniForm()
        context = {'roots': roots,
                   'child_root': {},
                   'form': form}

        for f in roots:
            child_root = folder.objects.filter(parent_ID_id=f.id).values_list('id', 'ten_Folder')  # child of root
            context['child_root'].update({f: child_root})

        context['tailieus'] = document.objects.filter(id_folder_id=folder_id)

        return render(request, self.template, context)


class document_gsat(View):
    '''
    Tài liệu cho phần HDCV của STQT Giám sát hệ thống
    (Tách riêng vì có phần subfolder - Mảng : Core, Access ...)
    '''
    template = 'Documents_Gsat.html'

    def post(self):
        return redirect('')

    def get(self, request):
        # BASE
        roots = folder.objects.exclude(parent_ID_id__isnull=False)
        form = Upload_miniForm()
        context = {'roots': roots,
                   'child_root': {},
                   'folder_mang': {},
                   'errors': {},
                   'document': {},
                   'form': form}
        for f in roots:
            child_root = folder.objects.filter(parent_ID_id=f.id).values_list(
                'id', 'ten_Folder')  # child of root folder
            context['child_root'].update({f: child_root})

        # Lấy danh sách Mảng trong thư mục HDCV của STQT Giám sát
        root_giamsat = folder.objects.get(ten_Folder='STQT Giám sát hệ thống')
        gsat_hdcv = folder.objects.filter(parent_ID_id=root_giamsat.id) \
                                  .get(ten_Folder='Hướng dẫn công việc')  # Thư mục HDCV của STQT Giám sát
        folder_mang = folder.objects.filter(parent_ID_id=gsat_hdcv.id)  # Core, Access, Paytv, ...
        context['folder_mang'] = folder_mang

        # Lấy danh mục lỗi tương ứng với từng mảng
        # {'Core': ['CRC', 'Nhiệt độ cao', '...']}, {'Access': ['..', '..']}, ...
        dmuc_loi = {}
        for mang in folder_mang:
            tmp = folder.objects.filter(parent_ID_id=mang.id).values_list('id', 'ten_Folder')  # CRC, Nhiệt độ cao,...
            dmuc_loi[mang] = tmp
        context['errors'].update(dmuc_loi)
        # Query toàn bộ tài liệu
        context['document'] = document.objects.all()

        return render(request, self.template, context)


# Upload function
def upload_hdcv(request):
    # user = CustomUser.objects.get(email=request.user)
    if request.method == 'POST':
        # print('file upload')
        # request.POST = request.POST.copy()
        # request.POST['ten'] = user
        form = UploadForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('manage')
    else:
        form = UploadForm()
    return render(request, 'Home.html', {'form': form})


# Xóa tài liệu ở menu chính
def delete_tlhh(request, tailieu_id=None):
    tailieu = get_object_or_404(document, id=tailieu_id)
    tailieu.delete()
    return redirect('manage')


# Lấy subfolder phần Upload page Manage
def get_subfolder(request):
    id = request.POST.get('id')
    child_folder = list(folder.objects.filter(parent_ID_id=id).values_list('id', 'ten_Folder'))
    return JsonResponse(child_folder, safe=False)


# Tìm kiếm
def Search(request):
    if request.method == 'GET':
        query = request.GET.get('q')
        document_results = document.objects.filter(Q(title__icontains=query) | Q(pdf__icontains=query))
        folder_results = folder.objects.filter(Q(ten_Folder__icontains=query))
    else:
        print(True)
    return render(request, 'search_result.html', {'document_results': document_results,
                                                  'folder_results': folder_results})


# Trash
def Trash(request):
    template = 'deletefile.html'
    return HienHanh_Trash(request, template)


# Quản lý tài liệu - Page Manage
def Manage(request):
    template = 'manage.html'
    form = UploadForm()
    return HienHanh_Trash(request, template)


# Page Tài liệu tới hạn
def Review(request):
    template = 'review.html'
    return HienHanh_Trash(request, template)


TL_bin = []
Update_bin = []
operation = []
var_pk = [0]
restore = []

def update(request, tailieu_id=None):
    old_tailieu = get_object_or_404(document, id=tailieu_id)  # tài liệu cũ
    user = CustomUser.objects.get(email=request.user)
    request.POST = request.POST.copy()
    form = Upload_miniForm(request.POST, request.FILES)
    if form.is_valid():
        form.save()
        return redirect('reviews')
    else:
        form = Upload_miniForm()

    if 'update_btn' in request.POST:
        documents = document.objects.all()
        user = CustomUser.objects.get(email=request.user)
        # request.POST = request.POST.copy()
        # request.POST['ten'] = user
        for n in documents:
            if old_tailieu.id == n.id:
                Update_bin.append(n)
        # Thay thế các trường của tài liệu cũ bằng các trường điền ở form
        tailieu_moi = document.objects.get(id=tailieu_id)
        tailieu_moi.pdf = request.FILES['pdf']
        tailieu_moi.author = str(request.user)
        tailieu_moi.title = request.POST['title']
        tailieu_moi.banhanh = request.POST['banhanh']
        tailieu_moi.toihan = request.POST['toihan']
        tailieu_moi.save()

        # for n in reviews:
        #     if n[1].id == new_hdcv.id:
        #         reviews.remove(n)
        #         # if n not in restore:
        #         operation.append(n[1])
        return redirect('reviews')


def HienHanh_Trash(request, template_name):
    TL_HH = []
    index = 0
    reviews = []
    hdcvs = document.objects.all()
    form = Upload_miniForm()

    roots = folder.objects.exclude(parent_ID_id__isnull=False)
    context = {'roots': roots,
               'child_root': {},
               'TL_HH': TL_HH,
               'TL_bin': TL_bin,
               'Update_bin': Update_bin,
               'reviews': reviews,
               'form': form}
    for f in roots:
        child_root = folder.objects.filter(parent_ID_id=f.id).values_list('id', 'ten_Folder')  # child of root folder
        context['child_root'].update({f: child_root})

    for hdcv in hdcvs:
        index += 1
        TL_HH.append([index, hdcv])  # Taì liệu hiện hành
        reviews.append([index, hdcv])  # Tài liệu reviews
        for m in reviews:
            for n in operation:
                if m[1] == n:
                    reviews.remove(m)
        for m in TL_HH:
            for n in restore:
                if m == n:
                    TL_HH.remove(m)
                else:
                    continue

    if 'delete' in request.POST:
# <<<<<<< HEAD
# =======
        print(request.POST['delete'])
# >>>>>>> fix in deletefile.html,Trash
        hdcv = document.objects.get(pk=int(request.POST['delete']))
        for m in TL_bin:
            if hdcv == m[1]:
                TL_bin.remove(m)
                hdcv.delete()

    elif 'delete_update' in request.POST:
        hdcv = document.objects.get(pk=int(request.POST['delete_update']))
        for m in Update_bin:
            if hdcv.id == m[1].id:
                Update_bin.remove(m)
                os.remove("media/" + str(m.pdf))

    elif 'restore_update' in request.POST:
        hdcv = document.objects.get(pk=int(request.POST['restore_update']))
        for m in Update_bin:
            if hdcv.id == m[1].id:
                hdcv = m
                hdcv.save()
                Update_bin.remove(m)

    elif 'restore' in request.POST:
        hdcv = document.objects.get(id=int(request.POST['restore']))
        for n in restore:
            if n[1] == hdcv:
                TL_HH.append(n)
                restore.remove(n)
        for m in TL_bin:
            if hdcv.id == m[1].id:
                TL_bin.remove(m)

    elif 'remove' in request.POST:
        for x in request.POST.getlist('item'):
            hdcv = document.objects.get(id=x)
            for value in TL_HH:
                if value[1].id == hdcv.id:
                    restore.append(value)
                    TL_HH.remove(value)
                    TL_bin.append(value)

    elif 'operation' in request.POST:
        ohdcv = document.objects.get(id=int(request.POST['operation']))
        for n in reviews:
            if n[1] == ohdcv:
                if ohdcv not in operation:
                    operation.append(ohdcv)
                reviews.remove(n)
        print(request.POST)

    elif 'Upload' in request.POST:
        user = CustomUser.objects.get(email=request.user)
        context['form'] = HDCVForm(initial={'author':request.user})
        if user is authenticate:
            user = request.user

        if request.method == 'POST':
            request.POST = request.POST.copy()
            form = UploadForm(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                return redirect('manage')
        else:
            form = UploadForm()
        return render(request, 'manage.html', {
            'form': form,
        })

    elif 'Update' in request.POST:
        k = int(request.POST['Update'])
        var_pk[0] = k  # Id của old docu
        form = UploadForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('reviews')
        else:
            form = UploadForm()
        context = {"form": form}
        return render(request, 'update_file.html', context)

    elif 'update_btn' in request.POST:
        user = CustomUser.objects.get(email=request.user)
        k = int(request.POST['Update'])
        request.POST = request.POST.copy()
        request.POST['ten'] = user
        form = UploadForm(request.POST, request.FILES)
        old_hdcv = document.objects.get(id=var_pk[0])  # list of hdcv's index
        for n in TL_HH:
            if old_hdcv.id == n[1].id:
                Update_bin.append(n)
        # Update_bin.append(old_hdcv) # TL_bin
        # Replace old file with new file
        new_hdcv = document.objects.get(id=var_pk[0])  # save into media folder
        new_hdcv.pdf = request.FILES['pdf']
        new_hdcv.ten = str(request.user)
        new_hdcv.date = request.POST['date']
        new_hdcv.banhanh = request.POST['banhanh']
        new_hdcv.toihan = request.POST['toihan']
        new_hdcv.save()
        for n in reviews:
            if n[1].id == new_hdcv.id:
                reviews.remove(n)
                # if n not in restore:
                operation.append(n[1])
        return redirect('reviews')

    return render(request, template_name, context)
