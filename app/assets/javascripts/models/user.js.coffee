TaskHero.User = DS.Model.extend
  login: DS.attr 'string'
  name: DS.attr 'string'
  lists: DS.hasMany 'list'
  tasks: DS.hasMany 'task'