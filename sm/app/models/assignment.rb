class Assignment < ActiveRecord::Base
	has_many :responses
	has_many :presentations
end
