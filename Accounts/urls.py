from django.urls import path
from . import views
from django.contrib.auth import views as auth_views

urlpatterns = [
    path('accounts/register', views.register, name='register'),
    path('accounts/profile', views.profile, name='profile'),
    path('accounts/login', auth_views.LoginView.as_view(template_name='accounts/login.html'), name='login'),
    path('', views.home, name='home')
]