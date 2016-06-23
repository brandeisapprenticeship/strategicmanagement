class Assignment < ActiveRecord::Base
	has_many :responses
	belongs_to :presentation

	def as_csv
	  CSV.generate do |csv|
	    csv << ["Student name","Response","Last updated"]
	    self.responses.each do |response|
	      csv << [response.user.name, ActionController::Base.helpers.sanitize(response.content, :tags=>[]), response.updated_at]
	    end
	  end
	end
end
