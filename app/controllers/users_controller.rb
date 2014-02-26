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

    if @user
      render :details
    else
      render status: :not_found, nothing: true
    end
  end

  # PUT /user/:login/edit
  def update
    @user = User.find_by_login params[:login]

    if @user and @user.update_attributes params[:user].permit(:name)
      render text: 'OK'
    elsif @user
      render status: :unprocessable_entity, text: @user.errors.to_hash.to_json
    else
      render status: :not_found, nothing: true
    end
  end

  # GET /user/:login/tasks
  def tasks
    @user = User.find_by_login params[:login]

    if @user
      @userTasks = @user.tasks
      render :tasks
      return
    end
    render status: :ok, nothing: true
  end

  # GET /user/:login/lists
  def lists
    @user = User.find_by_login params[:login]

    if @user
      @userLists = @user.lists
      render :lists
      return
    end
    render status: :ok, nothing: true
  end

end
