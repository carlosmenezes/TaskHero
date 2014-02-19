require 'spec_helper'

describe User do

	it 'can be created' do
		user = FactoryGirl.create :user

		user.should_not be_nil
    user.should be_valid
	end

  it { should validate_presence_of :name }
  it { should validate_presence_of :login }
  it { should validate_uniqueness_of :login }
  it { should validate_presence_of :password }
  it { should ensure_length_of(:password).is_at_least 6 }

  it { should have_many :lists }
  it { should have_many :tasks }
	
end