class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
    	t.string :discussion_title
    	t.datetime :due_date
    	t.string :discussion_question
    	t.string :edit_question

      t.String :discussion_title
      t.datetime :due_date
      t.string :discussion_question
      t.string :edit_question 

    end
  end
end