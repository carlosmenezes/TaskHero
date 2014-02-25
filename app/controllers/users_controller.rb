class UsersController < ApplicationController

  # POST /user/new
  def create
    @user = User.create params[:user].permit(:name, :login, :password)

    if @user.valid?
      render status: :created, text: 'OK'
    else
      render status: :unprocessable_entity, text: @user.errors.to_hash.to_json
    end
  end

  # GET /user/:login/show
  def show
    @user = User.find_by_login params[:login]

    puts "user ================================> #{@user}"

    if @user
      render 'user/details'
    else
      halt 404
    end
  end

  # PUT /user/:login/edit
  def edit
    @user = User.find_by_login params[:login]

    if @user and @user.update_attributes params[:user]
      'OK'
    elsif @user
      halt 422, @user.errors.to_hash.as_json
    else
      halt 404
    end
  end

  # GET /user/:login/tasks
  def user_tasks
    @user = User.find_by_login params[:login]

    if @user
      @userTasks = @user.tasks
      render 'user/tasks'
    end
  end

  # GET /user/:login/lists
  def user_lists
    @user = User.find_by_login params[:login]

    if @user
      @userLists = @user.lists
      render 'user/lists'
    end
  end

end
