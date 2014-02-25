class ListsController < ApplicationController

  # GET /lists/:id
  def show
    begin
      @list = List.find params[:id]
      render :details
    rescue ActiveRecord::RecordNotFound => e
      render status: :not_found, nothing: true
    end
  end

  # PUT /list/:id/edit
  def update
    begin
      @list = List.find params[:id]

      if @list and @list.update_attributes params[:list].permit(:name)
        render text: 'OK'
      else
        render status: :unprocessable_entity, text: @list.errors.to_hash.to_json
      end
    rescue ActiveRecord::RecordNotFound => e
      render status: :not_found, nothing: true
    end
  end

  # POST /list/new
  def create
    @list = List.create params[:list].permit(:name, :user_id, :user)

    if @list.valid?
      render text: 'OK', status: :created
    else
      render status: :unprocessable_entity, text: @list.errors.to_hash.to_json
    end
  end

  # DELETE /list/:id/delete
  def destroy
    begin
      @list = List.find params[:id]
      @list.delete
      render text: 'OK'
    rescue ActiveRecord::RecordNotFound => e
      render status: :not_found, nothing: true
    end
  end

  # GET /list/:id/tasks
  def tasks
    # need tests!
    begin
      @list = List.find params[:id]
      @tasks = list.tasks
      render 'list/tasks'
    rescue ActiveRecord::RecordNotFound => e
      render status: :not_found, nothing: true
    end
  end
end
