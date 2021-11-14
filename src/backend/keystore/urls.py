from django.urls import path
from .views import KeystoreBase

urlpatterns = [
    path('', KeystoreBase.as_view()),
    path('<str:name>/', KeystoreBase.as_view())
]
