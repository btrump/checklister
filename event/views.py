from django.shortcuts import render_to_response
from django.template import RequestContext
from models import *
from forms import *

def home(request, *args, **kwargs):
  event = Event.objects.get(pk=1)
  kwargs.update({'event':event})
  context = RequestContext(request, kwargs)
  return render_to_response('homepage/index.html', context)

def form(request, *args, **kwargs):
  event = Event.objects.get(pk=kwargs['event_id'])
  forms = dict()
  inventories = dict()
  for inventory in Inventory.objects.filter(event=event.id):
    item_entries = []
    for item_entry in ItemEntry.objects.filter(inventory=inventory.id):
      item_entry_form = ItemEntryForm({
                                       'name': item_entry.item
                                       },
                                      instance=item_entry)

      item_entries.append(item_entry_form)
    inventories[inventory.name] = dict({
                                        'form': InventoryForm(instance=inventory),
                                        'item_entries': item_entries
                                        })
  forms = {
           'event': EventForm(instance=event),
           'inventories': inventories.iteritems(),
           }
  kwargs.update({'forms':forms.iteritems()})
  context = RequestContext(request, kwargs)
  return render_to_response('event/edit_form.html', context)