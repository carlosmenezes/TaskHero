class User < ActiveRecord::Base

	has_many :tasks, :dependent => :destroy
	has_many :lists, :dependent => :destroy

	validates_presence_of :name, :login, :password
	validates :password, :length => { :minimum => 6 }
	validates_uniqueness_of :login

end
