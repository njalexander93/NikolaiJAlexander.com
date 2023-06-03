"""
Views for core_app.

This module contains the view functions for the core_app of the nikolaijalexander.com website.

Typical Usage Examples:

"""
from django.shortcuts import render
from django.http import HttpRequest, HttpResponse
from django.views import View


__author__ = "Nikolai Alexander"
__email__ = "njalexander93@gmail.com"
__version__ = "1.0.0"
__date__ = "2023-06-03"
__license__ = "None"
__copyright__ = "Copyright (c) 2021 Nikolai Alexander"



class HomeView(View):
    @staticmethod
    def get(request: HttpRequest) -> HttpResponse:
        """
        Render the home page.

        Args:
            request (django.http.HttpRequest): The request object.
        Returns:
            django.http.HttpResponse: Rendered response.
        Raises:
            None
        """
        return render(request, 'index.html')
