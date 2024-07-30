from django.contrib import admin
from django.urls import include, path
from django.conf import settings
from Accounts.views import home




urlpatterns = [
    path('', home, name='home'), 
    path('accounts/', include('Accounts.urls')),
     path('admin/', admin.site.urls),
    path('bank/', include('Bank.urls')),
    
]

