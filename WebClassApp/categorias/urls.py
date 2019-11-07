from django.urls import path, re_path
from . import views

app_name = 'categorias'
urlpatterns = [
    path('', views.index, name='index'),
    path('crear_categoria', views.crear_categoria, name='crear_categoria'),
    path('process_new_categories', views.process_new_categories, name='process_new_categories'),
    path('ver_categoria/<int:categoria_id>', views.ver_categoria, name='ver_categoria'),
    re_path(r'^delete_category/(?P<pk>[0-9]+)/$', views.delete_category, name='delete_category'),
    path('index_flutter', views.index_flutter, name='index_flutter'),
    path('process_new_categories_flutter', views.process_new_categories_flutter, name='process_new_categories_flutter'),
    path('delete_category_flutter', views.delete_category_flutter, name='delete_category_flutter'),
    path('ver_categoria_flutter', views.ver_categoria_flutter, name='ver_categoria_flutter'),

]
