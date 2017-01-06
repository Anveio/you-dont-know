class DropQuestionsFromTrialapps < ActiveRecord::Migration[5.0]
  def change
    remove_column :trialapps, :question_one
    remove_column :trialapps, :question_two
    remove_column :trialapps, :question_three
    remove_column :trialapps, :question_four
  end
end
