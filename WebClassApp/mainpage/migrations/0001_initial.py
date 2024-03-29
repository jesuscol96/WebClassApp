# Generated by Django 2.2.1 on 2019-10-05 22:03

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Coupons',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_id', models.IntegerField()),
                ('student_id', models.CharField(max_length=255)),
                ('course_id', models.IntegerField(blank=True, null=True)),
                ('category_id', models.IntegerField(blank=True, null=True)),
                ('user_account_id', models.IntegerField(blank=True, null=True)),
                ('available_on_course_page', models.CharField(max_length=255)),
                ('type', models.CharField(max_length=255)),
                ('price', models.FloatField()),
                ('status', models.CharField(max_length=255)),
                ('deadline', models.DateTimeField()),
                ('coundown_timer', models.FloatField(blank=True, null=True)),
                ('total_available', models.IntegerField()),
                ('total_remaining', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(blank=True, null=True)),
                ('updated_at', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'coupons',
            },
        ),
        migrations.CreateModel(
            name='PasswordResets',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.CharField(max_length=255)),
                ('token', models.CharField(max_length=255)),
                ('created_at', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'password_resets',
            },
        ),
        migrations.CreateModel(
            name='Payments',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_id', models.IntegerField()),
                ('category_id', models.IntegerField(blank=True, null=True)),
                ('course_id', models.IntegerField(blank=True, null=True)),
                ('amount', models.FloatField()),
                ('status', models.CharField(max_length=255)),
                ('mode_of_payment', models.CharField(blank=True, max_length=255, null=True)),
                ('payment_processor', models.CharField(blank=True, max_length=255, null=True)),
                ('deleted_at', models.DateTimeField(blank=True, null=True)),
                ('created_at', models.DateTimeField(blank=True, null=True)),
                ('updated_at', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'payments',
            },
        ),
        migrations.CreateModel(
            name='Roles',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('deleted_at', models.DateTimeField(blank=True, null=True)),
                ('created_at', models.DateTimeField(blank=True, null=True)),
                ('updated_at', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'roles',
            },
        ),
        migrations.CreateModel(
            name='Users_details',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_id', models.IntegerField(blank=True, null=True)),
                ('phone', models.CharField(blank=True, max_length=255, null=True)),
                ('paystack_authorization_code', models.CharField(blank=True, max_length=255, null=True)),
                ('paystack_customer_code', models.CharField(blank=True, max_length=255, null=True)),
                ('gender', models.CharField(blank=True, max_length=255, null=True)),
                ('date_of_birth', models.DateField(blank=True, null=True)),
                ('is_subscribed', models.IntegerField(blank=True, null=True)),
                ('email_verified_at', models.DateTimeField(blank=True, null=True)),
                ('view_count', models.IntegerField()),
                ('role_id', models.IntegerField()),
                ('remember_token', models.CharField(blank=True, max_length=100, null=True)),
                ('deleted_at', models.DateTimeField(blank=True, null=True)),
                ('created_at', models.DateTimeField(blank=True, null=True)),
                ('updated_at', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'users_details',
            },
        ),
    ]
