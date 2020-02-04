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
        if user is authenticate:
            user = request.user

        if request.method == 'POST':
            request.POST = request.POST.copy()
            form = UploadForm(request.POST, request.FILES)
            if form.is_valid():
                form.save()
                return redirect('hdcv_list')
        else:
            form = UploadForm()
        return render(request, 'hdcv_list.html', {
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