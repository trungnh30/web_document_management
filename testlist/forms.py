from django import forms
from django.db import models
from .models import folder, document, CustomUser
from django.utils.translation import gettext, ugettext_lazy as _
from django.contrib.auth.hashers import UNUSABLE_PASSWORD_PREFIX, identify_hasher
from django.contrib.auth.models import Group
from django.contrib.auth.forms import UserCreationForm, UserChangeForm


class UploadForm(forms.ModelForm):
    root = forms.ModelChoiceField(queryset=folder.objects.exclude(parent_ID_id__isnull=False), label=_('Thư mục STQT'))

    class Meta:
        model = document
        fields = ('pdf',
                  'root',
                  'title',
                  'author',
                  'version',
                  'banhanh',
                  'toihan'
                  )

        labels = {'banhanh': _('Ngày Ban Hành'),
                  'toihan': _('Ngày Tới Hạn'),
                  'pdf': _('File'),
                  'title': _('Tiêu Đề'),
                  'author': _('Người Upload'),
                  'id_folder': _('Thư mục con')}

    # def __init(self, *args, **kwargs):
    #     extra_fields = kwargs.pop('extra', 0)
    #     super(UploadForm, self).__init__(*args, **kwargs)
    #     self.fields['id_folder'].widget = forms.HiddenInput()


class Upload_miniForm(forms.ModelForm):

    class Meta:
        model = document
        fields = ('pdf',
                  'id_folder',
                  'title',
                  'author',
                  'version',
                  'banhanh',
                  'toihan'
                  )

        labels = {'banhanh': _('Ngày Ban Hành'),
                  'toihan': _('Ngày Tới Hạn'),
                  'pdf': _('File'),
                  'title': _('Tiêu Đề'),
                  'author': _('Người Upload'),
                  'id_folder': _('Thư mục')}


# Modify trang admin
class CustomUserCreationForm(UserCreationForm):
    is_superuser = forms.BooleanField(
        label='Superuser Status', help_text='User có mọi quyền trong trang quản trị ', initial=False, required=False)
    is_staff = forms.BooleanField(
        label='Staff user', help_text='User có thể login vào trang quản trị ', initial=False, required=False)
    is_active = forms.BooleanField(
        label='User', help_text='User có thể vào trang giao diện ', initial=False, required=False)
    groups = models.ManyToManyField(
        Group,
        verbose_name=_('group'),
        blank=True,
        help_text=_(
            ' '
            'granted to each of their groups.'
        ),
        related_name="user_set",
        related_query_name="user",
    )

    password1 = forms.CharField(
        label=_("Mật khẩu"),
        strip=False,
        widget=forms.PasswordInput(attrs={'autocomplete': 'new-password'}),
        help_text=_(
            "Mật khẩu yêu cầu ít nhất 8 kí tự và bao gồm cả chữ thường và chữ hoa"),
    )
    password2 = forms.CharField(
        label=_("Nhập lại mật khẩu"),
        widget=forms.PasswordInput(attrs={'autocomplete': 'new-password'}),
        strip=False,

    )

    class Meta(UserCreationForm):
        model = CustomUser
        fields = ('email',)


class ReadOnlyPasswordHashWidget(forms.Widget):
    template_name = 'auth/widgets/read_only_password_hash.html'
    read_only = True

    def get_context(self, name, value, attrs):
        context = super().get_context(name, value, attrs)
        summary = []
        if not value or value.startswith(UNUSABLE_PASSWORD_PREFIX):
            summary.append({'label': gettext("No password set.")})
        else:
            try:
                hasher = identify_hasher(value)
            except ValueError:
                summary.append(
                    {'label': gettext("Invalid password format or unknown hashing algorithm.")})
            else:
                for key, value_ in hasher.safe_summary(value).items():
                    summary.append({'label': gettext(key), 'value': value_})
        context['summary'] = summary
        return context


class ReadOnlyPasswordHashField(forms.Field):
    widget = ReadOnlyPasswordHashWidget

    def __init__(self, *args, **kwargs):
        kwargs.setdefault("required", False)
        super().__init__(*args, **kwargs)

    def bound_data(self, data, initial):
        # Always return initial because the widget doesn't
        # render an input field.
        return initial

    def has_changed(self, initial, data):
        return False


class CustomUserChangeForm(UserChangeForm):
    password = ReadOnlyPasswordHashField(
        label=_("Mật khẩu"),
        help_text=_(
            'Mật khẩu được mã hóa '
            'Bạn muốn thay đổi mật khẩu ?? '
            '<a href="{}">Thay đổi mật khẩu</a>.'
        ),
    )
    is_superuser = forms.BooleanField(
        label='Superuser status', help_text='User có mọi quyền trong trang quản trị ', initial=False, required=False)
    is_staff = forms.BooleanField(
        label='Staff user', help_text='User có thể login vào trang quản trị ', initial=False, required=False)
    is_active = forms.BooleanField(
        label='User', help_text='User có thể vào trang giao diện ', initial=False, required=False)

    class Meta:
        model = CustomUser
        fields = ('email',)
