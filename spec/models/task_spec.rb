require "spec_helper"

describe Task do

  it 'can be created' do
    task = FactoryGirl.build :task
    task.user = FactoryGirl.create :user
    task.list = FactoryGirl.build :list
    task.list.user = task.user

    expect(task).not_to be_nil
    expect(task).to be_valid
  end

  it 'can be created too' do
    task = FactoryGirl.build :task
    task.user = FactoryGirl.create :user

    expect(task).not_to be_nil
    expect(task).to be_valid
  end

  it { expect(Task.new).to validate_presence_of :title }
  it { expect(Task.new).to belong_to :user }
  it { expect(Task.new).to belong_to :list }

end