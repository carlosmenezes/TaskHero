require 'spec_helper'

describe List do

  it 'can be created' do
    list = build :list
    list.user = create :user

    expect(list).not_to be_nil
    expect(list).to be_valid
  end

  it { should validate_presence_of :name }
  it { should belong_to :user }
  it { should have_many :tasks }

end