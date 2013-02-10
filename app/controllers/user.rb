TaskHero.controllers :user do

  # /user/new deve existir?
  get :new do
    
  end

  # /user/new
  post :new do
    @user = User.create params[:user]
    # renderizar o que?
  end

  # /user/:login/edit
  get :edit, :map => '/user/:login/edit' do
    @user = User.find_by_login params[:login]
    # será que terei que criar um .rabl?
  end

  # /user/:login/edit
  put :edit, :map => '/user/:login/edit' do
    @user = User.find_by_login params[:login]
    @user.update_attributes params[:user]
    # renderizar o que?
  end  

  # /user/:login/tasks
  get :userTasks, :map => '/user/:login/tasks' do
    @userTasks = User.find_by_login(params[:login]).tasks
    render 'user/tasks'
  end
  
  # /user/:login/lists
  get :userLists, :map => '/user/:login/lists' do
    @userLists = User.find_by_login(params[:login]).lists
    render 'user/lists'
  end

end
