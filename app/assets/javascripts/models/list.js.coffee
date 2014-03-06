TaskHero.List = DS.Model.extend
  name: DS.attr 'string'
  user: DS.belongsTo 'user'
  tasks: DS.hasMany 'task'