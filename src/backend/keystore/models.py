from django.db import models

class Keystore(models.Model):
    keyid = models.IntegerField(primary_key=True)
    keyname = models.CharField(max_length=255, null=False)
    password = models.CharField(max_length=255, null=False)
    genre = models.CharField(max_length=255)
    memo = models.TextField()
    url = models.CharField(max_length=255)
    class Meta:
        db_table = 'keystore'
        managed = False
