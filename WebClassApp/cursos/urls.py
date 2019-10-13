from django.urls import path

from . import views

app_name = 'cursos'
urlpatterns = [
    path('', views.index, name='index'),
    path('crear_curso', views.crear_curso, name='crear_curso'),
    path('process_new_curso', views.process_new_curso, name='process_new_curso'),
    path('ver_curso/<int:curso_id>', views.ver_curso, name='ver_curso'),
    path('subscribe/<int:curso_id>', views.process_subscribe, name='process_subscribe'),
    path('subscriptions', views.ver_subscriptions, name='subscriptions'),
    path('my_courses', views.my_courses, name='my_courses'),

]
