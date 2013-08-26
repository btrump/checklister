from django.db import models
from checklist import Checklist
  
class ChecklistItem(models.Model):
  name = models.CharField(max_length=100)
  description = models.TextField(blank=True, default='')
  checklist = models.ForeignKey(Checklist)
  complete = models.BooleanField(blank=False, null=False, default=False)
  
  class Meta:
    app_label = "event"
    
  def __unicode__(self):
    return self.name