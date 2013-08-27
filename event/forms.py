from models import *
from django.forms import ModelForm
from django import forms

class EventForm(ModelForm):
  name = forms.CharField(label='Name')

  class Meta:
    model = Event
    fields = ('name',)
      
class InventoryForm(ModelForm):
  name = forms.CharField(label='Name')
  multiplier = forms.IntegerField()
  multiplier_unit = forms.CharField()

  class Meta:
    model = Inventory
    fields = ('name', 'multiplier', 'multiplier_unit')
    
class ItemEntryForm(ModelForm):
  item = forms.IntegerField()
  name = forms.CharField()
  image = forms.ImageField()
  unit = forms.CharField()
  quantity_per_unit = forms.DecimalField(decimal_places=2)
  quantity_total = forms.DecimalField(decimal_places=2)
  acquired = forms.BooleanField()
  
  class Meta:
    model = ItemEntry
    fields = ('item', 'quantity', 'acquired')