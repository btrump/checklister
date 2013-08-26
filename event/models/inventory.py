from django.db import models
from event import Event

class Inventory(models.Model):
  name = models.CharField(max_length=100)
  event = models.ForeignKey(Event)
  multiplier = models.IntegerField(blank=False, null=False, default=1)
  multiplier_unit = models.CharField(blank=False, null=False, max_length=100)
  multiplier_unit.help_text = u"Units of the multiplier, such as 'person', or 'attempt'"

  class Meta:
    app_label = "event"
    
  def __unicode__(self):
    return self.name
  
  def get_cost(self):
    cost = 0
    for entry in self.itementry_set.all():
      cost += entry.get_cost()
    return cost
  
  def get_cost_per_unit(self):
    return self.get_cost()/self.multiplier