from django.db import models

class Item(models.Model):
  name = models.CharField(max_length=200)
  unit = models.CharField(max_length=100)
  unit.help_text = u"Units of this item, such as 'pound', 'gram', or 'bottle'"
  price = models.DecimalField(decimal_places=2, max_digits=10)
  price.help_text = u"Price per unit of this item"
  image = models.ImageField(upload_to="items")
  
  class Meta:
    app_label = "event"
    
  def __unicode__(self):
    return self.name