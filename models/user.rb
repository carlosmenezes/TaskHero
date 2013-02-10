class User < ActiveRecord::Base

	has_many :tasks, :dependent => :destroy
	has_many :lists, :dependent => :destroy

end
