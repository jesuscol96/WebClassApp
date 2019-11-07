from rest_framework import serializers
from django.contrib.auth.models import User
from .models import *

class CategoriesSerializer(serializers.ModelSerializer):
    class Meta:
        model= Categories
        fields = ['pk','name','description','view_count','deleted_at','created_at','updated_at']
