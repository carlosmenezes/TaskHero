#= require jquery
#= require handlebars
#= require ember
#= require ember-data
#= require_self
#= require task_hero

# for more details see: http://emberjs.com/guides/application/
window.TaskHero = Ember.Application.create
  LOG_TRANSITIONS: true
  DEBUG: true
  LOG_VIEW_LOOKUPS: true