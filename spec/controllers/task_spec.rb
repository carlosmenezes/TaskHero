require 'spec_helper'

describe 'TaskController' do

  describe 'POST #new' do

    context 'with valid attributes' do
      
      it 'should create task' do
        task = FactoryGirl.build :task
        task.user = FactoryGirl.create :user

        expect{
          post '/task/new', task: task.attributes
        }.to change(Task, :count).by 1
      end

      #it { should respond_with :created }
    end

    context 'with invalid attributes' do
    end
  end

end