"""URL configuration for the resume_project project.

This module handles the URL configuration for the nikolaijalexander.com website.
"""
from django.contrib import admin
from django.urls import path, include


__author__ = "Nikolai Alexander"
__email__ = "njalexander93@gmail.com"
__version__ = "1.0.0"
__date__ = "2023-06-03"
__license__ = "None"
__copyright__ = "Copyright (c) 2021 Nikolai Alexander"


# URL patterns to access the pages on the website.
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core_app.urls'))
]
