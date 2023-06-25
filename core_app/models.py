"""
Database models for the core_app.

This module defines the database models used in the core_app of the Nikolaijalexander.com website.

Typical Usage Examples:
    1. Define a model class representing a specific data entity, e.g. a `User` model:
        ```python
        class User(models.Model):
            username = models.CharField(max_length=100)
            email = models.EmailField()
            # Add other fields and methods as needed
        ```

    2. Create and update records in the database using the defined models:
        ```python
        # Create a new user
        user = User.objects.create(username='john', email='john@example.com')

        # Retrieve and update an existing user
        user = User.objects.get(username='john')
        user.email = 'newemail@example.com'
        user.save()
        ```

    3. Perform database queries using model managers and querysets:
        ```python
        # Get all users
        users = User.objects.all()

        # Filter users based on specific criteria
        active_users = User.objects.filter(is_active=True)

        # Perform complex queries using chained methods
        specific_users = User.objects.filter(age__gte=18).exclude(email__contains='example')
        ```
"""

__author__ = "Nikolai Alexander"
__email__ = "njalexander93@gmail.com"
__version__ = "1.0.0"
__date__ = "TBD"
__license__ = "CC BY-ND 4.0"
__copyright__ = "Copyright (c) 2023 Nikolai Alexander"

# from django.db import models

# Create your models here.
