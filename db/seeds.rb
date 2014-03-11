name = "Carlos"
login = "task_hero"
password = "123456"

user = User.create :name => name, :login => login, :password => password

list = List.create :name => "Development tasks", :user => user

title = "First Task"
description = "Create some database records in seeds.rb file..."

task = Task.create :title => title, :description => description, :user => user
list.tasks << task

title = "Second Task"
description = "Test the TaskController to see if it spit some json on screen..."

task = Task.create :title => title, :description => description, :user => user
list.tasks << task

title = "Improve the application model"
description = "Improve the application model creating the List class and the associations needed."

task = Task.create :title => title, :description => description, :user => user
list.tasks << task

list.save