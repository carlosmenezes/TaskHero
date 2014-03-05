require 'spec_helper'

describe List do

  it 'can be created' do
    list = build :list
    list.user = create :user

    expect(list).not_to be_nil
    expect(list).to be_valid
  end

  it { expect(List.new).to validate_presence_of :name }

  it { expect(List.new).to belong_to :user }

  it { expect(List.new).to have_many :tasks }

end