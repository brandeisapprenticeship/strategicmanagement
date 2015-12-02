class Assignment < ActiveRecord::Base
	has_many :responses
	
	belongs_to :presentation 
end
