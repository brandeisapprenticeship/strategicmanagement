class Assignment < ActiveRecord::Base
	has_many :responses
	belongs_to :presentation

	def as_csv
	  CSV.generate do |csv|
	    csv << ["Student name","Response","Last updated"]
	    no_response = User.where.not(id: self.responses.pluck(:user_id)).where(admin: false)
	    self.responses.each do |response|
	      csv << [response.user.name, ActionController::Base.helpers.sanitize(response.content, :tags=>[]), response.updated_at]
	    end
	    no_response.each do |user|
	    	csv << [user.name, "(no response)", "-"]
	    end
	  end
	end
end
