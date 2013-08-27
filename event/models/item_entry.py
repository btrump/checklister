from django.db import models
from item import Item
from inventory import Inventory
 
class ItemEntry(models.Model):
  inventory = models.ForeignKey(Inventory)
  item = models.ForeignKey(Item)
  quantity = models.DecimalField(decimal_places=2, max_digits=10)
  acquired = models.BooleanField(blank=False, null=False, default=False)

  class Meta:
    app_label = "event"
    
  def __unicode__(self):
    return self.item.name
    
  def quick_display(self):
    return "%s x %s (%s)" % (self.item.name, self.quantity, self.get_cost())
  
  def get_quantity(self):
    return self.quantity * self.inventory.multiplier
  
  def get_cost(self):
    return self.item.price * self.quantity * self.inventory.multiplier
  
  def get_form_data(self):
    data = {
            'name':self.item,
            'image': self.item.image.url,
            'unit': self.item.unit,
            'quantity': self.quantity,
            'quantity_total': self.get_quantity(),
            'price': self.item.price,
            'price_total': self.get_cost()
            }
    return data