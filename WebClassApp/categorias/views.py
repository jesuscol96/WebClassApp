from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required

from django.urls import reverse
from .models import Categories
# Create your views here.

def index(request):
    if request.user.is_authenticated:
        username = request.user.username
        is_superuser = request.user.is_superuser
    else:
        username = 'none'
        is_superuser = False
    categorias = Categories.objects.all()
    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'categorias': categorias
    }
    return render(request,'categorias/index.html',context)

@login_required
def crear_categoria(request):
    return render(request,'categorias/crear_categorias.html')

def delete_category(request,pk):
    categoria = get_object_or_404(Categories,pk=pk)
    if request.method == 'POST':         # If method is POST,
        categoria.delete()                     # delete the cat.
        return HttpResponseRedirect(reverse('categorias:index'))
    return render(request,'categorias/index.html')

def process_new_categories(request):
    name = request.POST['name']
    description = request.POST['description']
    categoria= Categories(name=name,description=description,view_count=1)
    categoria.save()
    return HttpResponseRedirect(reverse('categorias:index'))

def ver_categoria(request,categoria_id):
    if request.user.is_authenticated:
        username = request.user.username
        is_superuser = request.user.is_superuser
    else:
        username = 'none'
        is_superuser = False
    categoria=Categories.objects.get(id=categoria_id)
    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'categoria': categoria
    }

    return render(request,'categorias/ver_categoria.html',context)
