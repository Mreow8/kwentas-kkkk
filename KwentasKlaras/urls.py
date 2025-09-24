# KwentasKlaras/urls.py
from django.contrib import admin
from django.urls import path, include
from KwentasApp.views import login_view, health_check

urlpatterns = [
    path('kwentasklarasmyadmin/', admin.site.urls),
    path('login/', login_view, name='login'),
    path('health/', health_check, name='health_check'),
    path('', include('KwentasApp.urls')),  
]
