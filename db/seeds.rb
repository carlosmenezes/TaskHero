title = "Firsk Task"
description = "Create some database records in seeds.rb file..."

task = Task.create :title => title, :description => description

title = "Second Task"
description = "Test the TaskController to see if it spit some json on screen..."

task = Task.create :title => title, :description => description