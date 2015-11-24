class Presentation < ActiveRecord::Base
	has_attached_file :slides
	belongs_to :assignment 
		
	validates_attachment_content_type :slides, :content_type => ['application/pdf', 'image/jpeg', 'application/vnd.openxmlformats-officedocument.presentationml.presentation']
																							
end
