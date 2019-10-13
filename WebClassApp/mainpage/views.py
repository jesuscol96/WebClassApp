from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User

from django.urls import reverse
from .models import Roles, Users_details

# Create your views here.

def index(request):
    if request.user.is_authenticated:
        user = request.user
        username = request.user.username
        is_superuser = request.user.is_superuser
        details = Users_details.objects.get(user_id=user.id)
        role = details.role_id
        role = role.name
        is_student = role=='Student'
    else:
        username = 'none'
        is_superuser = False
        role = 'none'
        is_student = False

    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'role': role,
        'is_student': is_student
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
