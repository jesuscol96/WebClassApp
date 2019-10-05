from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout

from django.urls import reverse

# Create your views here.

def index(request):
    return render(request,'categorias/index.html')
