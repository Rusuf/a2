# Generated by Django 5.0.6 on 2024-07-30 19:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Bank', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='bank',
            name='owner',
        ),
    ]
