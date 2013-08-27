from django.db import models

class Event(models.Model):
  name = models.CharField(max_length=100)
  date = models.DateTimeField()

  class Meta:
    app_label = "event"
    
  def __unicode__(self):
    return self.name
  
  def time_remaining(self):
    from datetime import datetime
    
    return self.date - datetime.now()