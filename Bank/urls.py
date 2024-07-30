from django.urls import path
from . import views

urlpatterns = [
    path('bank/home', views.home, name='home1'),
    path('bank/add_bank', views.add_bank, name='banks'),
    path('bank/add_branch', views.add_branch, name='branches'),

]
