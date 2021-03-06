require 'spec_helper'

describe TasksController, type: :api do

  describe 'GET #:id/show' do

    context 'existent task' do

      it 'should return task' do
        task = FactoryGirl.build :task
        task.user = FactoryGirl.create :user
        task.save

        get "tasks/#{task.id}"

        expect(last_response.status).to eq 200
        expect(last_response.body).to match /{"title":"Sample task","description":"Do something cool...","due_date":null,"alert_time":null,"completed":false}/
      end
    end

    context 'inexistent task' do

      it 'should return nothing' do
        get "tasks/-11111"

        expect(last_response.status).to eq 404
        expect(last_response.body.strip).to eq ''
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
          put "tasks/#{task.id}", task: task.attributes
        }.to change(Task, :count).by 0

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq 'OK'
      end
    end

    context 'update with invalid data' do

      it 'shouldn\'t update task' do

        task = FactoryGirl.build :task
        task.user = FactoryGirl.create :user
        task.save

        task.title = nil

        expect{
          put "tasks/#{task.id}", task: task.attributes
        }.to change(Task, :count).by 0

        expect(last_response.status).to eq 422
        expect(last_response.body).to eq '{"title":["can\'t be blank"]}'
      end
    end
  end

  describe 'POST #new' do

    context 'with valid attributes' do

      it 'should create task' do
        task = FactoryGirl.build :task, title: 'Sample task'
        task.user = FactoryGirl.create :user

        expect{
          post 'tasks', task: task.attributes
        }.to change(Task, :count).by 1

        expect(last_response.status).to eq 201 # created
        expect(last_response.body).to eq "OK"
      end
    end

    context 'with invalid attributes' do
      it 'shouldn\'t create task' do
        task = FactoryGirl.build :task, title: ""
        task.user = FactoryGirl.create :user

        expect{
          post 'tasks', task: task.attributes
        }.to change(Task, :count).by 0

        expect(last_response.status).to eq 422 # unprocessable_entity
        expect(last_response.body).to eq '{"title":["can\'t be blank"]}'
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
          delete "/tasks/#{task.id}"
        }.to change(Task, :count).by -1

        expect(last_response.status).to eq 200
        expect(last_response.body).to eq 'OK'
      end
    end

    context 'task not exists' do
      it 'should do nothing' do
        expect{
          delete "/tasks/-1111"
        }.to change(Task, :count).by 0

        expect(last_response.status).to eq 404
      end
    end
    # add more contexts to test a diferent owner deleting a task
  end
end