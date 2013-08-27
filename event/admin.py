from django.contrib import admin
from models import *

class EventAdmin(admin.ModelAdmin):
  pass
admin.site.register(Event, EventAdmin)

class ChecklistAdmin(admin.ModelAdmin):
  pass
admin.site.register(Checklist, ChecklistAdmin)

class ChecklistItemAdmin(admin.ModelAdmin):
  pass
admin.site.register(ChecklistItem, ChecklistItemAdmin)

class InventoryAdmin(admin.ModelAdmin):
  pass
admin.site.register(Inventory, InventoryAdmin)

class ItemAdmin(admin.ModelAdmin):
  list_display = ('name', 'unit', 'price')
  list_order = ('price')
admin.site.register(Item, ItemAdmin)

class ItemEntryAdmin(admin.ModelAdmin):
  pass
admin.site.register(ItemEntry, ItemEntryAdmin)
