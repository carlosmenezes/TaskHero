TaskHero.controllers :list do
  
  # /list/:id/show
  get :show, :map => '/list/:id/show' do
    begin
      @list = List.find params[:id]  
      render 'list/details'
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end

  # /list/:id/edit
  put :edit, :map => '/list/:id/edit' do
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

  # /list/new
  post :new do
    @list = List.create params[:list]

    if @list.valid?
      status 201 # created
      'OK'
    else   
      halt 422, @list.errors.to_hash.as_json # unprocessable_entity      
    end
  end

  # /list/:id/delete
  delete :delete, :map => '/list/:id/delete' do
    begin
      @list = List.find params[:id]
      @list.delete
      'OK'
    rescue ActiveRecord::RecordNotFound => e
      halt 404
    end
  end
end
