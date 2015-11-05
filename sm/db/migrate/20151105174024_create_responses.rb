class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
    	t.text :student_responses
    	t.

      t.timestamps null: false
    end
  end
end
