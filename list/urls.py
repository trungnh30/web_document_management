"""list URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from testlist import views
from django.conf.urls.static import static
from django.conf import settings


urlpatterns = [
    path('admin/', admin.site.urls),
    path('login.html/', views.login.as_view(), name='login'),
    path('accounts/', include('django.contrib.auth.urls')),
    path('', views.Home.as_view(), name='Hôm'),
    # Đường dẫn show tài liệu
    path('Document/Giamsat', views.document_gsat.as_view(), name='Documents_Gsat'),
    path('Document/Khac/<int:folder_id>',views.document_others.as_view(), name='Documents_Others'),
    path('Document/Khac/upload', views.upload_hdcv, name='new_docs'),
    path('search/', views.Search, name='search'),
    # Xóa tài liệu hiện hành
    path('delete/<int:tailieu_id>', views.delete_tlhh, name='remove_tlhh'),
    path(r'^update/<int:tailieu_id>/', views.update, name='update'),
    path('manage/', views.Manage, name='manage'),
    path('manage/reviews/', views.Review, name='reviews'),
    path('manage/reviews/update', views.get_subfolder, name='get_subfolder'),
    path('manage/deletefile/', views.Trash, name='trash'),

                ]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
