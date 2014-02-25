collection @allTasks

attributes :id, :title, :description, :due_date, :completed
child(:user) { attributes :name }