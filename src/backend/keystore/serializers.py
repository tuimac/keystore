from rest_framework import serializers
from .models import Keystore

class KeystoreSerializer(serializers.ModelSerializer):

    class Meta:
        model = Keystore
        fields = ['keyid', 'keyname', 'password', 'genre', 'memo', 'url']
