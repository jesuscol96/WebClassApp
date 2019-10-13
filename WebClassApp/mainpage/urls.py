from django.urls import path

from . import views

app_name = 'mainpage'
urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.login_view, name='login'),
    path('logout', views.logout_view, name='logout'),
    path('process_login', views.process_login, name='process_login'),
    path('register', views.register, name='register'),
    path('process_register', views.process_register, name='process_register'),
    

]
