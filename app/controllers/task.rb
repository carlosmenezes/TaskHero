TaskHero.controllers :task do

  # /task/all
  get :all, :provides => :json do
    @allTasks = Task.includes :user
    render 'task/index'
  end

  # /task/:id/show
  get :show, :map => '/task/:id/show' do
    begin
      @task = Task.find params[:id]  
      render 'task/details'
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end

  # /task/:id/edit
  put :edit, :map => '/task/:id/edit' do
    begin
      @task = Task.find params[:id]

      if @task and @task.update_attributes params[:task]
        'OK'
      else
        halt 422, @task.errors.to_hash.as_json
      end
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end
  
  # /task/new
  post :new do
    @task = Task.create params[:task]

    if @task.valid?
      status 201 # created
      'OK'
    else   
      halt 422, @task.errors.to_hash.as_json # unprocessable_entity      
    end
  end

  # /task/:id/delete
  delete :delete, :map => '/task/:id/delete' do
    begin
      @task = Task.find params[:id]
      @task.delete
      'OK'
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end
end
