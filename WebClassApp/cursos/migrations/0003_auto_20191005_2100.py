# Generated by Django 2.2.1 on 2019-10-06 01:00

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('cursos', '0002_auto_20191005_1923'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='comments',
            name='category_id',
        ),
        migrations.RemoveField(
            model_name='comments',
            name='item_id',
        ),
        migrations.RemoveField(
            model_name='courseuser',
            name='category_id',
        ),
        migrations.RemoveField(
            model_name='courseuser',
            name='user_account_id',
        ),
        migrations.RemoveField(
            model_name='views',
            name='user_account_id',
        ),
    ]
