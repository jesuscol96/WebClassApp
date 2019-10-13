from django.urls import path

from . import views

app_name = 'categorias'
urlpatterns = [
    path('', views.index, name='index'),
    path('crear_categoria', views.crear_categoria, name='crear_categoria'),
    path('process_new_categories', views.process_new_categories, name='process_new_categories'),
    path('ver_categoria/<int:categoria_id>', views.ver_categoria, name='ver_categoria'),

]
