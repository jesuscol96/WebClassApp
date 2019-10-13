from django.db import models

# Create your models here.

class Categories(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField(blank=True, null=True)
    view_count = models.IntegerField()
    deleted_at = models.DateTimeField(blank=True, null=True)
    created_at = models.DateTimeField(blank=True, null=True)
    updated_at = models.DateTimeField(blank=True, null=True)

    class Meta:
        db_table = 'categories'
