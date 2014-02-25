require 'spec_helper'

describe ListsController, type:  :api do

  describe 'GET show' do

    context 'existent list' do

      it 'should return list' do
        list = FactoryGirl.build :list
        list.user = FactoryGirl.create :user
        list.save

        get  "lists/#{list.id}"

        last_response.status.should eq 200
        last_response.body.should match /{"name":"Task list","description":"A simple list with daily tasks..."}/
      end
    end

    context 'inexistent list' do

      it 'should return nothing' do
        get "lists/-11111"

        last_response.status.should eq 404
        last_response.body.strip.should eq ''
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
          put "lists/#{list.id}", :list => list.attributes
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
          put "lists/#{list.id}", :list => list.attributes
        }.to change(List, :count).by 0

        last_response.status.should eq 422
        last_response.body.should eq '{"name":["can\'t be blank"]}'
      end
    end
  end

  describe 'POST' do

    context 'with valid attributes' do

      it 'should create list' do
        list = FactoryGirl.build :list
        list.user = FactoryGirl.create :user

        expect{
          post '/lists', list: list.attributes
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
          post '/lists', list: list.attributes
        }.to change(List, :count).by 0

        last_response.status.should eq 422 # unprocessable_entity
        last_response.body.should eq '{"name":["can\'t be blank"]}'
      end
    end
  end

  describe 'DELETE #:id' do

    context 'list exists' do
      it 'should delete list' do
        list = FactoryGirl.build :list
        list.user = FactoryGirl.create :user
        list.save

        expect{
          delete "/lists/#{list.id}"
        }.to change(List, :count).by -1

        last_response.status.should eq 200
        last_response.body.should eq 'OK'
      end
    end

    context 'list not exists' do
      it 'should do nothing' do
        expect{
          delete "/lists/-1111"
        }.to change(List, :count).by 0

        last_response.status.should eq 404
      end
    end

    context 'list doesn\'t belong to user' do
      it 'should do nothing' do
        # to test this context I must implement authentication first
      end
    end
  end
end
