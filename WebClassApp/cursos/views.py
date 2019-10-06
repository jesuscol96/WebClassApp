from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

from django.urls import reverse
from .models import Courses
from categorias.models import Categories
# Create your views here.


# Create your views here.
def index(request):
    if request.user.is_authenticated:
        username = request.user.username
        is_superuser = request.user.is_superuser
    else:
        username = 'none'
        is_superuser = False
    cursos = Courses.objects.all()
    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'cursos': cursos,
    }
    return render(request,'cursos/index.html',context)

@login_required
def crear_curso(request):
    categorias = Categories.objects.all()
    return render(request,'cursos/crear_curso.html',{'categorias':categorias})

def process_new_curso(request):
    title = request.POST['title']
    subtitle = request.POST['subtitle']
    description = request.POST['description']
    categoria_id = request.POST['categoria']
    about_instructor = request.POST['about_instructor']
    playlist_url = request.POST['playlist_url']
    what_will_students_learn = request.POST['what_will_students_learn']
    target_students = request.POST['target_students']
    requirements = request.POST['requirements']
    discount_price = request.POST['discount_price']
    actual_price = request.POST['actual_price']

    curso= Courses(title=title,
                   sub_title=subtitle,
                   description=description,
                   category_id=Categories.objects.get(id=categoria_id),
                   about_instructor=about_instructor,
                   playlist_url=playlist_url,
                   what_will_students_learn=what_will_students_learn,
                   target_students=target_students,
                   requirements=requirements,
                   discount_price=discount_price,
                   actual_price=actual_price,
                   admin_status=1,
                   creator_status=1,
                   view_count=1)
    curso.save()
    return HttpResponseRedirect(reverse('cursos:index'))

def ver_curso(request,curso_id):
    if request.user.is_authenticated:
        username = request.user.username
        is_superuser = request.user.is_superuser
    else:
        username = 'none'
        is_superuser = False
    curso=Courses.objects.get(id=curso_id)
    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'curso': curso,    
    }

    return render(request,'cursos/ver_curso.html',context)
