"""
URL configuration for core_app.

This module defines the URL patterns for the core_app of the Nikolaijalexander.com website.

Typical Usage Examples:
    1. Include the core_app URLconf in your project urls.py like this::
        path('', include('core_app.urls'))
"""

__author__ = "Nikolai Alexander"
__email__ = "njalexander93@gmail.com"
__version__ = "1.0.0"
__date__ = "TBD"
__license__ = "CC BY-ND 4.0"
__copyright__ = "Copyright (c) 2023 Nikolai Alexander"

from django.urls import path
from core_app import views

app_name = 'core_app'

urlpatterns = [
    path('', views.HomeView.as_view(), name='home'), # URL pattern for the home page
]
