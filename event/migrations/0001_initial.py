# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Event'
        db.create_table(u'event_event', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('date', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal('event', ['Event'])

        # Adding model 'Checklist'
        db.create_table(u'event_checklist', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('event', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['event.Event'])),
        ))
        db.send_create_signal('event', ['Checklist'])

        # Adding model 'ChecklistItem'
        db.create_table(u'event_checklistitem', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('description', self.gf('django.db.models.fields.TextField')(default='', blank=True)),
            ('checklist', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['event.Checklist'])),
            ('complete', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('event', ['ChecklistItem'])

        # Adding model 'Item'
        db.create_table(u'event_item', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('unit', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('price', self.gf('django.db.models.fields.DecimalField')(max_digits=10, decimal_places=2)),
        ))
        db.send_create_signal('event', ['Item'])

        # Adding model 'Inventory'
        db.create_table(u'event_inventory', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('event', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['event.Event'])),
            ('multiplier', self.gf('django.db.models.fields.IntegerField')(default=1)),
            ('multiplier_unit', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('event', ['Inventory'])

        # Adding model 'ItemEntry'
        db.create_table(u'event_itementry', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('inventory', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['event.Inventory'])),
            ('item', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['event.Item'])),
            ('quantity', self.gf('django.db.models.fields.DecimalField')(max_digits=10, decimal_places=2)),
            ('acquired', self.gf('django.db.models.fields.BooleanField')(default=False)),
        ))
        db.send_create_signal('event', ['ItemEntry'])


    def backwards(self, orm):
        # Deleting model 'Event'
        db.delete_table(u'event_event')

        # Deleting model 'Checklist'
        db.delete_table(u'event_checklist')

        # Deleting model 'ChecklistItem'
        db.delete_table(u'event_checklistitem')

        # Deleting model 'Item'
        db.delete_table(u'event_item')

        # Deleting model 'Inventory'
        db.delete_table(u'event_inventory')

        # Deleting model 'ItemEntry'
        db.delete_table(u'event_itementry')


    models = {
        'event.checklist': {
            'Meta': {'object_name': 'Checklist'},
            'event': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['event.Event']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'event.checklistitem': {
            'Meta': {'object_name': 'ChecklistItem'},
            'checklist': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['event.Checklist']"}),
            'complete': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'description': ('django.db.models.fields.TextField', [], {'default': "''", 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'event.event': {
            'Meta': {'object_name': 'Event'},
            'date': ('django.db.models.fields.DateTimeField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'event.inventory': {
            'Meta': {'object_name': 'Inventory'},
            'event': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['event.Event']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'multiplier': ('django.db.models.fields.IntegerField', [], {'default': '1'}),
            'multiplier_unit': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'event.item': {
            'Meta': {'object_name': 'Item'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'price': ('django.db.models.fields.DecimalField', [], {'max_digits': '10', 'decimal_places': '2'}),
            'unit': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'event.itementry': {
            'Meta': {'object_name': 'ItemEntry'},
            'acquired': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'inventory': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['event.Inventory']"}),
            'item': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['event.Item']"}),
            'quantity': ('django.db.models.fields.DecimalField', [], {'max_digits': '10', 'decimal_places': '2'})
        }
    }

    complete_apps = ['event']