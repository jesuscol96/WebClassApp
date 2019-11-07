from rest_framework import serializers
from django.contrib.auth.models import User
from .models import *

class CoursesSerializer(serializers.ModelSerializer):
    class Meta:
        model= Courses
        fields = ['id','user_id','category_id','title','sub_title','description','about_instructor','playlist_url','tags','photo','promo_video_url','creator_status','admin_status','what_will_students_learn','target_students','requirements','discount_price','actual_price','view_count','subscriber_count','deleted_at','created_at','updated_at']

class CourseUserSerializer(serializers.ModelSerializer):
    class Meta:
        model= CourseUser
        fields = ['user_id','course_id','paid_date','expiry_date','plan','paid_amount','status','deleted_at','created_at','updated_at']
