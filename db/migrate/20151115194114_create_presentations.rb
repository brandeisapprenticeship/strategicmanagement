class CreatePresentations < ActiveRecord::Migration
  def change
    create_table :presentations do |t|

      t.timestamps null: false
      t.string :title
      t.attachment :slides
    end
  end
end
