from django.db import models
from django.contrib.auth.models import AbstractUser
from django.utils.translation import ugettext_lazy as _
from .managers import CustomUserManager
from datetime import datetime, timedelta
import os


# Modify class User
class CustomUser(AbstractUser):
    username = None
    email = models.EmailField(_('email address'), unique=True)
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    objects = CustomUserManager()

    def __str__(self):
        return self.email


class folder(models.Model):
    '''
    Class folder : (Adjacency List)
    **************************************************
    *  ID     |      ten_Folder     |    parent_ID   *
    *  1      |    STQT Chất lượng  |        null    *
    *  2      |     STQT GSHT       |        null    *
    *  ....                                          *
    *  10     |      Quy trình      |         1      *
    *  11     |       HDCV          |         2      *
    * ....
    *  20     |        CORE         |         11     *
    *  21     |       ACCESS        |         11     *
    * ....                                           *
    **************************************************
    '''
    ten_Folder = models.CharField(max_length=255)
    parent_ID = models.ForeignKey(
        'self', blank=True, null=True, db_index=True, on_delete=models.CASCADE)

    def __str__(self):
        return self.ten_Folder


class document(models.Model):
    '''
    Declare model
    '''
    id_folder = models.ForeignKey(folder, on_delete=models.CASCADE)
    title = models.CharField(max_length=100)
    pdf = models.FileField(upload_to='books/pdfs/')
    author = models.CharField(null=True, blank=True, max_length=100)
    banhanh = models.DateTimeField(default=datetime.now, null=True)
    toihan = models.DateTimeField(default=datetime.now() + timedelta(minutes=30))
    version = models.DecimalField(max_digits=3, decimal_places=1, blank=True, null=True)
# <<<<<<< HEAD
# =======
    view = models.PositiveIntegerField(default=0)
# >>>>>>> fix in deletefile.html,Trash

    def banhanhpublished(self):
        return self.banhanh.strftime('%B %d %Y')

    def toihanpublished(self):
        return self.toihan.strftime('%B %d %Y')

    def delete(self, *args, **kwargs):
        self.pdf.delete()
        super().delete(*args, **kwargs)

    def filename(self):
        return os.path.basename(self.pdf.name)


class request(models.Model):
    '''
    '''
    id_folder = models.ForeignKey(folder, on_delete=models.CASCADE)
    reason = models.CharField(max_length=100)
