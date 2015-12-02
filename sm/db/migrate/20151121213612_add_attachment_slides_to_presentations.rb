class AddAttachmentSlidesToPresentations < ActiveRecord::Migration
  def self.up
    change_table :presentations do |t|
      t.attachment :slides
    end
  end

  def self.down
    remove_attachment :presentations, :slides
  end
end
