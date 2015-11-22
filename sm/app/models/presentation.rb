class Presentation < ActiveRecord::Base
	has_attached_file :slides

	validates_attachment_content_type :slides, :content_type => ['application/pdf', 'image/jpeg']
end
