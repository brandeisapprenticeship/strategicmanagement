class Presentation < ActiveRecord::Base
	has_attached_file :slides
	has_many :assignments 
		
	validates_attachment_content_type :slides, :content_type => ['application/pdf', 'image/jpeg', 'application/vnd.openxmlformats-officedocument.presentationml.presentation']
	
	validates :slides, :title, :presence => true

	def self.current
		self.all.order("created_at desc").first || nil
	end																			
end
