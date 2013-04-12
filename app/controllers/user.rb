TaskHero.controllers :user do

  # /user/new
  post :new do
    @user = User.create params[:user]
    
    if @user.valid?
      status 201
      'OK'
    else
      halt 422, @user.errors.to_hash.as_json
    end
  end

  # /user/:login/show
  get :show, :map => '/user/:login/show' do
    @user = User.find_by_login params[:login]

    if @user
      render 'user/details'
    else
      halt 404
    end
  end

  # /user/:login/edit
  put :edit, :map => '/user/:login/edit' do
    @user = User.find_by_login params[:login]

    if @user and @user.update_attributes params[:user]
      'OK'
    elsif @user
      halt 422, @user.errors.to_hash.as_json
    else
      halt 404
    end
  end  

  # /user/:login/tasks
  get :userTasks, :map => '/user/:login/tasks' do
    @user = User.find_by_login params[:login]

    if @user
      @userTasks = @user.tasks
      render 'user/tasks'
    end
  end
  
  # /user/:login/lists
  get :userLists, :map => '/user/:login/lists' do
    @user = User.find_by_login params[:login]

    if @user
      @userLists = @user.lists
      render 'user/lists'
    end
  end

end
