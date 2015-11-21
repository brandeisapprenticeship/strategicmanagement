class AddAttachmentPowerpointToPresentations < ActiveRecord::Migration
  def self.up
    change_table :presentations do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :presentations, :file
  end
end
