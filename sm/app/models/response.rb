class Response < ActiveRecord::Base

	belongs_to :user
	belongs_to :assignment

	validates :assignment_id, presence: { :message => "You must choose an assignment tag."}

end
