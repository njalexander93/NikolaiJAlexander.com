"""
Views for core_app pf the nikolaijalexander.com website.

This module contains the classes for rendering the main pages of the nikolaijalexander.com website.

Typical Usage Examples:
    1. To render the home page, create an instance of the HomeView class and call its `get` method with the appropriate
       request object:

        ```
        home_view = HomeView()
        response = home_view.get(request)
        ```

        This will return a rendered response for the home page.
"""

__author__ = "Nikolai Alexander"
__email__ = "njalexander93@gmail.com"
__version__ = "1.0.0"
__date__ = "TBD"
__license__ = "CC BY-ND 4.0"
__copyright__ = "Copyright (c) 2023 Nikolai Alexander"

from django.shortcuts import render
from django.http import HttpRequest, HttpResponse
from django.views import View



class HomeView(View):
    """
    The view class for rendering the home page.

    Attributes:
        None.
    """

    def __init__(self) -> None:
        """
        Class constructor.

        Args:
            self: Pointer to the HomeView class.
        Returns:
            None.
        Raises:
            None.
        """
        super().__init__()
        self.template_name = 'core_app/index.html'


    def get(self, request: HttpRequest) -> HttpResponse:
        """
        Method for rendering the home page.

        Args:
            self: Pointer to the HomeView class.
            request (django.http.HttpRequest): The request object.
        Returns:
            django.http.HttpResponse: Rendered response.
        Raises:
            None.
        """
        return render(request, self.template_name)
