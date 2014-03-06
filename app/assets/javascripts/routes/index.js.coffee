TaskHero.IndexRoute = Ember.Route.extend
  renderTemplate: () ->
    @render 'index'

    @render  'lists',
      outlet: 'lists'
      controller: 'lists'