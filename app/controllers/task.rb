TaskHero.controllers :task do

  # /task/all
  get :all, :provides => :json do
    @allTasks = Task.includes(:user)
    render 'task/index'
  end
  
end
