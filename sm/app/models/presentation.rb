class Presentation < ActiveRecord::Base
	has_attached_file :file 

	validates_attachment_content_type :pdf, :content_type => ['Presentation/pdf', 'Presentation/msword', 'text/plain'], :if => :pdf_attached?

def pdf_attached?
  self.pdf.file?
end

end
