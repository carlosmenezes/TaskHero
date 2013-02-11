require "spec_helper"

describe Task do
	
	it 'can be created' do
		task = FactoryGirl.build :task
    task.user = FactoryGirl.create :user
    task.list = FactoryGirl.build :list
    task.list.user = task.user

    task.should_not be_nil
    task.should be_valid
	end

  it 'can be created too' do
    task = FactoryGirl.build :task
    task.user = FactoryGirl.create :user    

    task.should_not be_nil
    task.should be_valid
  end

  it { should validate_presence_of :title }
  it { should belong_to :user }
  it { should belong_to :list }

end