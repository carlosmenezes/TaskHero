TaskHero.Task = DS.Model.extend
  title: DS.attr 'string'
  description: DS.attr 'string'
  user: DS.belongsTo 'user'
  list: DS.belongsTo 'list'

TaskHero.Task.FIXTURES = [
    {
        id: 1
        title: "First Task"
        description: "Create some database records in seeds.rb file..."
        due_date: null
        completed: false
        # user: {
        #     name: "Carlos"
        # }
    }
    {
        id: 2
        title: "Second Task"
        description: "Test the TaskController to see if it spit some json on screen..."
        due_date: null
        completed: false
        # user: {
        #     name: "Carlos"
        # }
    }
    {
        id: 3
        title: "Improve the application model"
        description: "Improve the application model creating the List class and the associations needed."
        due_date: null
        completed: false
        # user: {
        #     name: "Carlos"
        # }
    }
]