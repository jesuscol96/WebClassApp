from django.db import models
from django.contrib.auth.models import User
from categorias.models import Categories
from cursos.models import Courses
from django.contrib.auth.models import User

class Roles(models.Model):
    name = models.CharField(max_length=255)
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:

        db_table = 'roles'

    def __str__(self):
        return self.name

class Users_details(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    phone = models.CharField(max_length=255, blank=True, null=True)
    paystack_authorization_code = models.CharField(max_length=255, blank=True, null=True)
    paystack_customer_code = models.CharField(max_length=255, blank=True, null=True)
    gender = models.CharField(max_length=255, blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    is_subscribed = models.IntegerField(blank=True, null=True)
    email_verified_at = models.DateTimeField(blank=True, null=True)
    view_count = models.IntegerField()
    role_id = models.ForeignKey(Roles, on_delete=models.CASCADE, blank=True, null=True)
    remember_token = models.CharField(max_length=100, blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'users_details'
    def __str__(self):
        return self.user_id.username

class PasswordResets(models.Model):
    email = models.CharField(max_length=255)
    token = models.CharField(max_length=255)
    created_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'password_resets'

class Payments(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    course_id = models.ForeignKey(Courses, on_delete=models.CASCADE, blank=True, null=True)
    amount = models.FloatField()
    status = models.CharField(max_length=255)
    mode_of_payment = models.CharField(max_length=255, blank=True, null=True)
    payment_processor = models.CharField(max_length=255, blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'payments'

class Coupons(models.Model):
    user_id = models.ForeignKey(User, on_delete=models.CASCADE, blank=True, null=True)
    course_id = models.ForeignKey(Courses, on_delete=models.CASCADE, blank=True, null=True)
    available_on_course_page = models.CharField(max_length=255)
    type = models.CharField(max_length=255)
    price = models.FloatField()
    status = models.CharField(max_length=255)
    deadline = models.DateTimeField()
    coundown_timer = models.FloatField(blank=True, null=True)
    total_available = models.IntegerField()
    total_remaining = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'coupons'
