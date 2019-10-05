from django.db import models

class Courses(models.Model):
    user_id = models.IntegerField()
    category_id = models.IntegerField()
    title = models.CharField(max_length=255)
    sub_title = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField()
    about_instructor = models.TextField(blank=True, null=True)
    playlist_url = models.CharField(max_length=255)
    tags = models.CharField(max_length=255, blank=True, null=True)
    photo = models.CharField(max_length=255, blank=True, null=True)
    promo_video_url = models.CharField(max_length=255, blank=True, null=True)
    creator_status = models.IntegerField()
    admin_status = models.IntegerField()
    what_will_students_learn = models.TextField(blank=True, null=True)
    target_students = models.TextField(blank=True, null=True)
    requirements = models.TextField(blank=True, null=True)
    discount_price = models.FloatField()
    actual_price = models.FloatField()
    view_count = models.IntegerField(blank=True, null=True)
    subscriber_count = models.IntegerField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'courses'

class CourseUser(models.Model):
    user_id = models.IntegerField()
    course_id = models.IntegerField(blank=True, null=True)
    category_id = models.IntegerField(blank=True, null=True)
    user_account_id = models.IntegerField(blank=True, null=True)
    paid_date = models.DateTimeField(blank=True, null=True)
    expiry_date = models.DateTimeField(blank=True, null=True)
    plan = models.CharField(max_length=255, blank=True, null=True)
    paid_amount = models.FloatField(blank=True, null=True)
    status = models.IntegerField()
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'course_user'


class Items(models.Model):
    user_id = models.IntegerField(blank=True, null=True)
    course_id = models.IntegerField()
    is_free = models.IntegerField(blank=True, null=True)
    thumbnail = models.CharField(max_length=255, blank=True, null=True)
    view_count = models.IntegerField()
    url = models.CharField(max_length=255, blank=True, null=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'items'

class Views(models.Model):
    user_id = models.IntegerField()
    user_account_id = models.IntegerField(blank=True, null=True)
    category_id = models.IntegerField(blank=True, null=True)
    course_id = models.IntegerField(blank=True, null=True)
    item_id = models.IntegerField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'views'

class Comments(models.Model):
    user_id = models.IntegerField()
    course_id = models.IntegerField(blank=True, null=True)
    category_id = models.IntegerField(blank=True, null=True)
    item_id = models.IntegerField(blank=True, null=True)
    body = models.TextField()
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'comments'
