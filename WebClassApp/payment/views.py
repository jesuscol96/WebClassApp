from django.shortcuts import render
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from paypal.standard.forms import PayPalPaymentsForm
from django.urls import reverse
from mainpage.models import Roles, Users_details
from django.views.decorators.csrf import csrf_exempt
from WebClassApp.settings import PAYPAL_RECEIVER_EMAIL
from django.contrib.auth.decorators import login_required

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
        role = 'none'
        is_student = False
        is_instructor = False

    context = {
        'is_user': request.user.is_authenticated,
        'username': username,
        'is_superuser' : is_superuser,
        'role': role,
        'is_student': is_student,
        'is_instructor': is_instructor
    }
    return render(request,'payment/index.html',context)

@csrf_exempt
def done(request):
    return render(request,'payment/done.html')

@csrf_exempt
def canceled(request):
    return render(request,'payment/canceled.html')

@login_required
def payment_process(request):
    host = request.get_host()

    paypal_dict = {
                    'business': PAYPAL_RECEIVER_EMAIL,
                    'amount': 100,
                    'item_name': 'course',
                    'invoice': 1,
                    'currency_code': 'USD',
                    'notify_url':   'http://{}{}'.format(host,reverse('paypal-ipn')),
                    'return_url':   'http://{}{}'.format(host,reverse('payment:done')),
                    'cancel_return':   'http://{}{}'.format(host,reverse('payment:canceled')),
    }

    form = PayPalPaymentsForm(initial=paypal_dict)

    context = { 'form': form,
                'is_user': True,   

    }

    return render(request,'payment/process.html',context)
