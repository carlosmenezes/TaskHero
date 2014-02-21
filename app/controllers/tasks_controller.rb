class TasksController < ApplicationController

  # GET /task/all
  def all #, :provides => :json do
    @allTasks = Task.includes :user
    render 'task/index'
  end

  # GET /task/:id/show
  def show
    begin
      @task = Task.find params[:id]  
      render 'task/details'
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end

  # PUT /task/:id/edit
  def edit
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
  
  # POST /task/new
  def new
    @task = Task.create params[:task]

    if @task.valid?
      status 201 # created
      'OK'
    else   
      halt 422, @task.errors.to_hash.as_json # unprocessable_entity      
    end
  end

  # DELETE /task/:id/delete
  def delete
    begin
      @task = Task.find params[:id]
      @task.delete
      'OK'
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end
end
