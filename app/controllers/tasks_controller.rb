class TasksController < ApplicationController

  def index
    @allTasks = Task.includes :user
  end

  # GET /tasks/:id
  def show
    begin
      @task = Task.find params[:id]
      render :details
    rescue ActiveRecord::RecordNotFound => e
      render status: :not_found, nothing: true
    end
  end

  # PUT /tasks/:id
  def update
    begin
      @task = Task.find params[:id]

      if @task and @task.update_attributes params[:task].permit(:title, :description, :list_id, :user_id)
        render text: 'OK'
      else
        render status: :unprocessable_entity, text: @task.errors.to_hash.to_json
      end
    rescue ActiveRecord::RecordNotFound => e
      render status: :not_found
    end
  end

  # POST /tasks
  def create
    @task = Task.create params[:task].permit(:title, :description, :list_id, :user_id)

    if @task.valid?
      render status: :created, text: 'OK'
    else
      render status: :unprocessable_entity, text: @task.errors.to_hash.to_json
    end
  end

  # DELETE /tasks/:id
  def destroy
    begin
      @task = Task.find params[:id]
      @task.delete
      render text: 'OK'
    rescue ActiveRecord::RecordNotFound => e
      render status: :not_found, nothing: true
    end
  end
end
