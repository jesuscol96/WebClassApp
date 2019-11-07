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
    path('index_flutter', views.index_flutter, name='index_flutter'),
    path('crear_curso_flutter', views.crear_curso_flutter, name='crear_curso_flutter'),
    path('process_new_curso_flutter', views.process_new_curso_flutter, name='process_new_curso_flutter'),
    path('ver_curso_flutter', views.ver_curso_flutter, name='ver_curso_flutter'),
    path('ver_subscriptions_flutter', views.ver_subscriptions_flutter, name='ver_subscriptions_flutter'),
    path('process_subscribe_flutter', views.process_subscribe_flutter, name='process_subscribe_flutter'),
    path('my_courses_flutter', views.my_courses_flutter, name='my_courses_flutter'),

]
