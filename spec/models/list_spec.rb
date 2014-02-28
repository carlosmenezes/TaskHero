require 'spec_helper'

describe List do

  it 'can be created' do
    list = build :list
    list.user = create :user

    expect(list).not_to be_nil
    expect(list).to be_valid
  end


  it 'is invalid without a name' do
    expect(List.new).to have(1).error_on(:name)
  end

  it 'is invalid without a user' do
   expect(List.new).to have(1).error_on(:user_id)
 end

end