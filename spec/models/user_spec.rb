require 'spec_helper'

describe User do

	let(:user) { User.new }

	it 'can be created' do
		shell.say 'testing...'
		user.should_not be_nil
	end

end



=begin
describe "Dummy Model" do
  let(:dummy) { Dummy.new }
  it 'can be created' do
    dummy.should_not be_nil
  end
end=end

