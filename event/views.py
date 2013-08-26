from django.shortcuts import render_to_response
from django.template import RequestContext
#from models.event import Event
from models import *

def home(request, *args, **kwargs):
  event = Event.objects.get(pk=1)
  kwargs.update({'event':event})
  context = RequestContext(request, kwargs)
  return render_to_response('homepage/index.html', context)