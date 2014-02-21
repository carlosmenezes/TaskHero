require 'spec_helper'

describe 'TaskController' do

  describe 'GET #:id/show' do
    
    context 'existent task' do
      
      it 'should return task' do
        task = FactoryGirl.build :task
        task.user = FactoryGirl.create :user
        task.save

        get "/task/#{task.id}/show"

        last_response.status.should eq 200
        last_response.body.should match /{"title":"Sample task","description":"Do something cool...","due_date":null,"alert_time":null,"completed":false}/
      end
    end

    context 'inexistent task' do
      
      it 'should return nothing' do
        get "/task/-11111/show"

        last_response.status.should eq 404
        last_response.body.should eq ''
      end
    end
  end

  describe 'PUT #:id/edit' do

    context 'update with valid data' do
      
      it 'should update task' do
        task = FactoryGirl.build :task
        task.user = FactoryGirl.create :user
        task.save

        task.title = 'Updated title'

        expect{
          put "task/#{task.id}/edit", :task => task.attributes
        }.to change(Task, :count).by 0

        last_response.status.should eq 200
        last_response.body.should eq 'OK'
      end
    end

    context 'update with invalid data' do
      
      it 'shouldn\'t update task' do

        task = FactoryGirl.build :task
        task.user = FactoryGirl.create :user
        task.save

        task.title = nil

        expect{
          put "task/#{task.id}/edit", :task => task.attributes
        }.to change(Task, :count).by 0
        
        last_response.status.should eq 422
        last_response.body.should eq '["title", ["can\'t be blank"]]'
      end
    end    
  end

  describe 'POST #new' do   

    context 'with valid attributes' do

      it 'should create task' do
        task = FactoryGirl.build :task
        task.user = FactoryGirl.create :user

        expect{
          post '/task/new', task: task.attributes
        }.to change(Task, :count).by 1

        last_response.status.should eq 201 # created
        last_response.body.should eq "OK"
      end
    end

    context 'with invalid attributes' do
      it 'shouldn\'t create task' do
        task = FactoryGirl.build :task, title: ""
        task.user = FactoryGirl.create :user

        expect{
          post '/task/new', task: task.attributes
        }.to change(Task, :count).by 0

        last_response.status.should eq 422 # unprocessable_entity        
        last_response.body.should eq '["title", ["can\'t be blank"]]'
      end
    end
  end

  describe 'DELETE #:id/delete' do

    context 'task exists' do
      it 'should delete task' do
        task = FactoryGirl.build :task
        task.user = FactoryGirl.create :user
        task.save

        expect{
          delete "/task/#{task.id}/delete"
        }.to change(Task, :count).by -1

        last_response.status.should eq 200
        last_response.body.should eq 'OK'
      end
    end

    context 'task not exists' do
      it 'should do nothing' do
        expect{
          delete "/task/-1111/delete"
        }.to change(Task, :count).by 0

        last_response.status.should eq 404
      end
    end
    # add more contexts to test a diferent owner deleting a task
  end
end