class Response < ActiveRecord::Base
	belongs_to :user
	belongs_to :assignment
	has_many :likes

	validates :assignment_id, presence: { :message => "You must choose an assignment tag."}

end
