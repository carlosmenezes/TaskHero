TaskHero.controllers :task do

  # /task/all
  get :all, :provides => :json do
    @allTasks = Task.includes(:user)
    render 'task/index'
  end
  
  post :new do
    @task = Task.create params[:task]
    render :nothing => true, :status => :created
  end

end
