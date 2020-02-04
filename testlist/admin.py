from django.contrib import admin
from .models import folder, document, CustomUser
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import gettext, gettext_lazy as _
from .forms import CustomUserCreationForm, CustomUserChangeForm


class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser
    list_display = ('email', 'is_superuser')
    list_filter = ('is_superuser', 'groups')
    fieldsets = ((None, {'fields': ('email',
                                    'password')}),
                 (_('Phân quyền'), {'fields': ('is_active',
                                               'is_staff',
                                               'is_superuser',
                                               'groups')}))

    add_fieldsets = ((_('Đăng kí tài khoản'), {'fields': ('email',
                                                          'password1',
                                                          'password2')}),
                     (_('Phân quyền và chọn các group mà user có quyền truy cập'), {'fields': ('is_active',
                                                                                               'is_staff',
                                                                                               'is_superuser',
                                                                                               'groups')}))
    search_fields = ('email',)
    ordering = ('email',)
    filter_horizontal = ('groups', 'user_permissions',)

admin.site.register(CustomUser, CustomUserAdmin)
admin.site.register(folder)
admin.site.register(document)
