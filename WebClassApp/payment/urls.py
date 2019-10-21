from django.urls import path

from . import views

app_name = 'payment'
urlpatterns = [
    path('', views.index, name='index'),
    path('process', views.payment_process, name='process'),
    path('done', views.done, name='done'),
    path('canceled', views.canceled, name='canceled'),
]
