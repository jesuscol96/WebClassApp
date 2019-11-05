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
    path('index_flutter', views.index_flutter, name='index_flutter'),
    path('process_login_flutter', views.process_login_flutter, name='process_login_flutter'),
    path('get_roles', views.get_roles, name='get_roles'),
    path('process_register_flutter', views.process_register_flutter, name='process_register_flutter'),
    path('logout_flutter', views.logout_view_flutter, name='logout_flutter'),
    path('show_users/<str:username>',views.show_users,name='show_users'),


]
