require 'spec_helper'

describe User do

  it 'can be created' do
    user = FactoryGirl.create :user

    expect(user).not_to be_nil
    expect(user).to be_valid
  end

  it { expect(User.new).to validate_presence_of :name }

  it { expect(User.new).to validate_presence_of :login }

  it { expect(User.new).to validate_uniqueness_of :login }

  it { expect(User.new).to validate_presence_of :password }

  it { expect(User.new).to ensure_length_of(:password).is_at_least 6 }

  it { expect(User.new).to have_many :lists }

  it { expect(User.new).to have_many :tasks }

end