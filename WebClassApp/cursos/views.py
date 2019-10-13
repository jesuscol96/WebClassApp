from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

from django.urls import reverse
from .models import Courses, CourseUser
from categorias.models import Categories
from mainpage.models import *
# Create your views here.


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
    cursos = Courses.objects.all()
    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'cursos': cursos,
        'is_student': is_student,
        'is_instructor': is_instructor

    }
    return render(request,'cursos/index.html',context)

@login_required
def crear_curso(request):
    if role.name != 'Student':
        categorias = Categories.objects.all()
        return render(request,'cursos/crear_curso.html',{'categorias':categorias})


@login_required
def process_new_curso(request):
    user = request.user
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
                   view_count=1,
                   user_id = user
                   )
    curso.save()
    return HttpResponseRedirect(reverse('cursos:index'))

def ver_curso(request,curso_id):
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
    curso=Courses.objects.get(id=curso_id)
    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'curso': curso,
        'is_student': is_student,
        'is_instructor': is_instructor
    }

    return render(request,'cursos/ver_curso.html',context)

@login_required
def process_subscribe(request,curso_id):
    user = request.user
    curso = Courses.objects.get(id=curso_id)

    subscription = CourseUser(course_id=curso,
                              user_id=user,
                              status=1)
    subscription.save()
    return HttpResponseRedirect(reverse('cursos:index'))

@login_required
def ver_subscriptions(request):
    user = request.user
    is_subs = True
    msg='ok'
    cursos_user = CourseUser.objects.filter(user_id=user.id)
    if len(cursos_user)==0:
        msg="No subscriptions"
        cursos='none'
        is_subs = False
    else:
        cursos=[]
        for curso in cursos_user:
            cursos.append(curso.course_id)

    context={
        'cursos': cursos,
        'msg': msg,
        'is_subs': is_subs
    }

    return render(request,'cursos/subscriptions.html',context)

@login_required
def my_courses(request):
    user = request.user
    is_cursos = True
    msg='ok'
    cursos= Courses.objects.filter(user_id=user.id)
    if len(cursos)==0:
        msg="No courses"
        cursos='none'
        is_cursos = False

    context={
        'cursos': cursos,
        'msg': msg,
        'is_cursos': is_cursos
    }
    return render(request,'cursos/my_courses.html',context)
