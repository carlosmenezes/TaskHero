class List < ActiveRecord::Base
	belongs_to :user
	has_many :tasks

	validates_presence_of :name
	validates_presence_of :user_id
end
