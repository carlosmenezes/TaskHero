require 'spec_helper'

describe UsersController, type: :api do

  describe 'POST #new' do

    context 'with valid attributes' do
      it 'should create user' do
        user = FactoryGirl.build :user

        expect{
          post 'users', user: user.attributes
        }.to change(User, :count).by 1

        last_response.status.should eq 201
        last_response.body.should eq 'OK'
      end
    end

    context 'with invalid attributes' do
      it 'shouldn\'t create user' do
        user = FactoryGirl.build :user, login: nil

        expect{
          post 'users', user: user.attributes
        }.to change(User, :count).by 0

        last_response.status.should eq 422
        last_response.body.should eq '{"login":["can\'t be blank"]}'
      end
    end
  end

  describe 'GET #:login/show' do

    context 'login exists' do
      it 'should return existent user' do

        post 'users', user: FactoryGirl.build(:user).attributes
        get 'users/mmadalena'

        last_response.status.should eq 200
        last_response.body.should eq '{"name":"Maria Madalena"}'
      end
    end

    context 'login not exists' do
      it 'should return 404 status for non existent user' do

        get '/user/mmdalena/show'
        last_response.status.should eq 404
      end
    end
  end

  describe 'PUT #:login/edit' do

    context 'update with valid data' do
      it 'should update user' do

        user = FactoryGirl.build(:user)

        post '/user/new', :user => user.attributes
        user.name += ' da Silva'

        expect{
          put '/user/mmadalena/edit', :user => user.attributes
        }.to change(Task, :count).by 0

        last_response.status.should eq 200
        last_response.body.should eq 'OK'
      end
    end

    context 'update with invalid data' do
      it 'shouldn\'t update user' do

        user = FactoryGirl.build(:user)

        post '/user/new', :user => user.attributes
        user.name = nil

        expect{
          put '/user/mmadalena/edit', :user => user.attributes
        }.to change(Task, :count).by 0

        last_response.status.should eq 422
        last_response.body.should eq '["name", ["can\'t be blank"]]'
      end
    end

    context 'login not exists' do
      it 'should return 404 status for non existent user' do

        expect{
          put '/user/mmdalena/edit', :user => FactoryGirl.build(:user).attributes
        }.to change(Task, :count).by 0
        last_response.status.should eq 404
      end
    end
  end

  describe 'GET #:login/tasks' do

    context 'user has tasks' do
      it 'should return the tasks from user' do

        user = FactoryGirl.create :user
        task = FactoryGirl.build :task
        task.user = user
        task.save

        get '/user/mmadalena/tasks'

        last_response.status.should eq 200
        last_response.body.should match /\[{\"id\":\d+,\"title\":\"Sample task\",\"description\":\"Do something cool...\",\"due_date\":null,\"completed\":false}\]/
      end
    end

    context 'user hasn\'t any task'  do
      it 'should return nothing' do

        get '/user/mmdalena/tasks'
        last_response.status.should eq 200
        last_response.body.should eq ''
      end
    end
  end

  describe 'GET #:login/lists' do

    context 'user has lists' do
      it 'should return the lists from user' do

        user = FactoryGirl.create :user
        list = FactoryGirl.build :list
        list.user = user
        list.save

        get '/user/mmadalena/lists'

        last_response.status.should eq 200
        last_response.body.should match /a/
      end
    end

    context 'user hasn\'t any list'  do
      it 'should return nothing' do

        get '/user/mmdalena/lists'
        last_response.status.should eq 200
        last_response.body.should eq ''
      end
    end
  end

end