from django.db import models
from event import Event

class Checklist(models.Model):
  name = models.CharField(max_length=100)
  event = models.ForeignKey(Event)

  class Meta:
    app_label = "event"
    
  def __unicode__(self):
    return self.name