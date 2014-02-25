class ListsController < ApplicationController
  
  # GET /lists/:id
  def show
    begin
      @list = List.find params[:id]  
      render 'list/details'
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end

  # PUT /list/:id/edit
  def update
    begin
      @list = List.find params[:id]

      if @list and @list.update_attributes params[:list]
        'OK'
      else
        halt 422, @list.errors.to_hash.as_json
      end
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end

  # POST /list/new
  def create
    @list = List.create params[:list]

    if @list.valid?
      status 201 # created
      'OK'
    else   
      halt 422, @list.errors.to_hash.as_json # unprocessable_entity      
    end
  end

  # DELETE /list/:id/delete
  def destroy
    begin
      @list = List.find params[:id]
      @list.delete
      'OK'
    rescue ActiveRecord::RecordNotFound => e
      halt 404
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
      halt 404
    end
  end
end
