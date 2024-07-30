#from django.apps import AppConfig


#class AccountsConfig(AppConfig):
    #default_auto_field = 'django.db.models.BigAutoField'
    #name = 'Accounts'

from django.apps import AppConfig

class AccountsConfig(AppConfig):
    name = 'Accounts'

    def ready(self):
        import Accounts.signals
