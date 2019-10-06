from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User

from django.urls import reverse

# Create your views here.

def index(request):
    if request.user.is_authenticated:
        username = request.user.username
        is_superuser = request.user.is_superuser
    else:
        username = 'none'
        is_superuser = False
    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
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
    return render(request,'mainpage/register.html')

def process_register(request):
    username = request.POST['username']
    email = request.POST['email']
    firstname = request.POST['firstname']
    lastname = request.POST['lastname']
    password  = request.POST['password']
    user = User.objects.create_user(username=username,
                                    password=password,
                                    email=email,
                                    first_name=firstname,
                                    last_name=lastname)
    user.save()
    login(request,user)
    return HttpResponseRedirect(reverse('mainpage:index'))
