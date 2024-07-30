from django.db import models
from django.contrib.auth.models import User

class Bank(models.Model):
    name = models.CharField(max_length=200)
    description = models.TextField()
    inst_num = models.CharField(max_length=200)
    swift_code = models.CharField(max_length=200)

    def __str__(self):
        return self.name

class Branch(models.Model):
    bank = models.ForeignKey(Bank, on_delete=models.CASCADE)
    name = models.CharField(max_length=200)
    transit_num = models.CharField(max_length=200)
    address = models.TextField()
    email = models.EmailField()
    capacity = models.PositiveIntegerField()

    def __str__(self):
        return self.name
