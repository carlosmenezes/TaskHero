TaskHero.IndexRoute = Ember.Route.extend
  model: -> @store.findAll 'task'

  renderTemplate: ->
    @render 'index'

    @render  'lists',
      outlet: 'lists'
      controller: 'lists'