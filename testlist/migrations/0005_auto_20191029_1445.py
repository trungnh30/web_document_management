# Generated by Django 2.2.5 on 2019-10-29 07:45

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('testlist', '0004_auto_20191029_1445'),
    ]

    operations = [
        migrations.AlterField(
            model_name='document',
            name='toihan',
            field=models.DateTimeField(default=datetime.datetime(2019, 10, 29, 15, 15, 58, 927116)),
        ),
    ]
