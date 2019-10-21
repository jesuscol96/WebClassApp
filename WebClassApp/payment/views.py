from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User

from django.urls import reverse
from mainpage.models import Roles, Users_details

def index(request):
    if request.user.is_authenticated:
        user = request.user
        username = request.user.username
        is_superuser = request.user.is_superuser
        details = Users_details.objects.filter(user_id=user.id)
        if len(details)>0:
            details=details[0]
            role = details.role_id
            role = role.name
            is_student = role=='Student'
            is_instructor = role=='Instructor'
        else:
            role = 'none'
            is_student = False
            is_instructor = False

    else:
        username = 'none'
        is_superuser = False
        role = 'none'
        is_student = False
        is_instructor = False

    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'role': role,
        'is_student': is_student,
        'is_instructor': is_instructor
    }
    return render(request,'payment/index.html',context)
