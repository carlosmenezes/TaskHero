TaskHero.UsersListsRoute = Ember.Route.extend
  model: -> @store.findAll 'list'