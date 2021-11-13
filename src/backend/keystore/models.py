from django.db import models

class Keystore(models.Model):
    keyname = models.CharField(primary_key=True, max_length=255)
    username = models.CharField(max_length=255)
    memo = models.TextField()
    genre = models.CharField(max_length=255)
    class Meta:
        db_table = 'K_KEYSTORE'
        managed = False
