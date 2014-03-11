TaskHero.IndexRoute = Ember.Route.extend
  model: ->
    @controllerFor('usersLists').set('model', @modelFor 'usersLists')
    @store.findAll 'task'

  renderTemplate: ->
    @render 'index'

    @render  'lists',
      outlet: 'lists'
      controller: 'usersLists'