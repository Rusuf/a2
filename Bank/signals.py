from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth.models import User
from .models import Bank, Branch

@receiver(post_save, sender=Bank)
def bank_created(sender, instance, created, **kwargs):
    if created:
        print(f'New Bank created: {instance.name}')

    Bank.objects.create(user=instance)
    



@receiver(post_save, sender=Branch)
def branch_created(sender, instance, created, **kwargs):
    if created:
        print(f'New Branch created: {instance.name}')
    Branch.objects.create(user=instance)

