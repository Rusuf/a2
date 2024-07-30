
from django.apps import AppConfig

class BankConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'Bank'

    def ready(self):
        import Bank.signals
