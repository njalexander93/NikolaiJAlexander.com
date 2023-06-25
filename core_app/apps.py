"""
The core_app module provides the application configuration for the core app.

This module represents the configuration for the core app in the Nikolaijalexander.com website. It sets the default auto
field and specifies the name of the app.

Typical Usage Examples:
    - Use the CoreAppConfig class to configure the core app in the INSTALLED_APPS list in your Django project's
      settings.
"""

__author__ = "Nikolai Alexander"
__email__ = "njalexander93@gmail.com"
__version__ = "1.0.0"
__date__ = "TBD"
__license__ = "CC BY-ND 4.0"
__copyright__ = "Copyright (c) 2023 Nikolai Alexander"

from django.apps import AppConfig

class CoreAppConfig(AppConfig):
    """
    The CoreAppConfig class represents the configuration for the core app.

    Attributes:
        None.
    """
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'core_app'
