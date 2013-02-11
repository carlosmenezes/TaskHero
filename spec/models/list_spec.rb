require 'spec_helper'

describe List do

	it 'can be created' do
		list = FactoryGirl.build :list
    list.user = FactoryGirl.create :user

    list.should_not be_nil
    list.should be_valid
	end

	it { should validate_presence_of :name }
	it { should belong_to :user }
  it { should have_many :tasks }

end