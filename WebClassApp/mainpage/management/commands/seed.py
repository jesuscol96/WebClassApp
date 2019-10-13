from django.core.management.base import BaseCommand
from mainpage.models import Roles

# import UserFactory here
roles = ['Student','Instructor']
class Command(BaseCommand):
    help = 'Seeds the database.'

    def handle(self, *args, **options):
        print('Seeding...')
        for role in roles:
            d = Roles(name=role)
            d.save()
        print('Roles have been seeded.')
