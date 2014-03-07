TaskHero.ListsRoute = Ember.Route.extend
  model: -> @store.findAll('list')