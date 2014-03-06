TaskHero.Task = DS.Model.extend
  title: DS.attr 'string'
  user: DS.belongsTo 'user'
  list: DS.belongsTo 'list'