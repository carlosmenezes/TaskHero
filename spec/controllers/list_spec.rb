require 'spec_helper'

describe "ListController" do
  
  describe 'GET #:id/show' do
    
    context 'existent list' do
      
      it 'should return list' do
        list = FactoryGirl.build :list
        list.user = FactoryGirl.create :user
        list.save

        get "/list/#{list.id}/show"

        last_response.status.should eq 200
        last_response.body.should match /{"name":"Task list","description":"A simple list with daily tasks..."}/
      end
    end

    context 'inexistent list' do
      
      it 'should return nothing' do
        get "/list/-11111/show"

        last_response.status.should eq 404
        last_response.body.should eq ''
      end
    end
  end

  describe 'PUT #:id/edit' do

    context 'update with valid data' do
      
      it 'should update list' do
        list = FactoryGirl.build :list
        list.user = FactoryGirl.create :user
        list.save

        list.name = 'Updated name'

        expect{
          put "list/#{list.id}/edit", :list => list.attributes
        }.to change(List, :count).by 0

        last_response.status.should eq 200
        last_response.body.should eq 'OK'
      end
    end

    context 'update with invalid data' do
      
      it 'shouldn\'t update list' do

        list = FactoryGirl.build :list
        list.user = FactoryGirl.create :user
        list.save

        list.name = nil

        expect{
          put "list/#{list.id}/edit", :list => list.attributes
        }.to change(List, :count).by 0
        
        last_response.status.should eq 422
        last_response.body.should eq '["name", ["can\'t be blank"]]'
      end
    end    
  end

  describe 'POST #new' do   

    context 'with valid attributes' do

      it 'should create list' do
        list = FactoryGirl.build :list
        list.user = FactoryGirl.create :user

        expect{
          post '/list/new', list: list.attributes
        }.to change(List, :count).by 1

        last_response.status.should eq 201 # created
        last_response.body.should eq "OK"
      end
    end

    context 'with invalid attributes' do
      it 'shouldn\'t create list' do
        list = FactoryGirl.build :list, name: ""
        list.user = FactoryGirl.create :user

        expect{
          post '/list/new', list: list.attributes
        }.to change(List, :count).by 0

        last_response.status.should eq 422 # unprocessable_entity        
        last_response.body.should eq '["name", ["can\'t be blank"]]'
      end
    end
  end

  describe 'DELETE #:id/delete' do

    context 'list exists' do
      it 'should delete list' do
        list = FactoryGirl.build :list
        list.user = FactoryGirl.create :user
        list.save

        expect{
          delete "/list/#{list.id}/delete"
        }.to change(List, :count).by -1

        last_response.status.should eq 200
        last_response.body.should eq 'OK'
      end
    end

    context 'list not exists' do
      it 'should do nothing' do
        expect{
          delete "/list/-1111/delete"
        }.to change(List, :count).by 0

        last_response.status.should eq 404
      end
    end
    # add more contexts to test a diferent owner deleting a list
  end  
end
