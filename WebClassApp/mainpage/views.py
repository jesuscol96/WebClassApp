import json
from urllib.parse import parse_qs
from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User

from django.urls import reverse
from .models import Roles, Users_details
from django.http import JsonResponse
from rest_framework.renderers import JSONRenderer
from rest_framework.parsers import JSONParser
from .serializers import *

# Create your views here.

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
    return render(request,'mainpage/index.html',context)

def login_view(request):
    return render(request,'mainpage/login.html')

def process_login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(request, username=username, password=password)
    if user is not None:
        login(request,user)
    return HttpResponseRedirect(reverse('mainpage:index'))

def logout_view(request):
    logout(request)
    return HttpResponseRedirect(reverse('mainpage:index'))

def register(request):
    roles = Roles.objects.all()
    context = {'roles':roles,}
    return render(request,'mainpage/register.html',context)

def process_register(request):
    username = request.POST['username']
    email = request.POST['email']
    firstname = request.POST['firstname']
    lastname = request.POST['lastname']
    password  = request.POST['password']
    phone  = request.POST['phone']
    gender  = request.POST['gender']
    date_of_birth  = request.POST['date_of_birth']
    role  = Roles.objects.get(id=request.POST['role'])
    user = User.objects.create_user(username=username,
                                    password=password,
                                    email=email,
                                    first_name=firstname,
                                    last_name=lastname)
    user.save()
    details=Users_details(user_id = user,
                  phone=phone,
                  gender=gender,
                  date_of_birth=date_of_birth,
                  role_id=role,
                  view_count=1)
    details.save()
    login(request,user)
    return HttpResponseRedirect(reverse('mainpage:index'))

#For flutter----------------------------------------------------------

def index_flutter(request):
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
    return JsonResponse(context)


def process_login_flutter(request):
    if request.method=="POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request,user)
            return JsonResponse({'is_login': True})
        else:
            return JsonResponse({'is_login': False})

def logout_view_flutter(request):
    logout(request)
    return JsonResponse({'is_logout': True})

def get_roles(request):
    roles = Roles.objects.all()
    serializer = RolesSerializer(roles,many=True)
    return JsonResponse(serializer.data,safe=False)

def process_register_flutter(request):
    if request.method=="POST":
        data=parse_qs(request.body.decode("utf-8"))
        username = data['username'][0]
        password = data['password'][0]
        email = data['email'][0]
        firstname = data['firstname'][0]
        lastname = data['lastname'][0]
        phone  = data['phone'][0]
        gender  = data['gender'][0]
        date_of_birth  = data['date_of_birth'][0]
        role  = Roles.objects.get(id=request.POST['role'])
        user = User.objects.create_user(username=username,
                                        password=password,
                                        email=email,
                                        first_name=firstname,
                                        last_name=lastname)
        user.save()
        details=Users_details(user_id = user,
                      phone=phone,
                      gender=gender,
                      date_of_birth=date_of_birth,
                      role_id=role,
                      view_count=1)
        details.save()
        login(request,user)
        context = {
                    'is_successful': True,
        }
        return JsonResponse(context,safe=False)

def show_users(request,username):
    if request.method == 'GET':
        if username == 'all':
            users = User.objects.all()
        else:
            users = User.objects.filter(username=username)
        serializer = UserSerializer(users,many=True)
        context = { 'users': serializer.data }
        return JsonResponse(context,safe=False)
