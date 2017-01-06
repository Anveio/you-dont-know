class AddQuestionsToTrialapp < ActiveRecord::Migration[5.0]
  def change
    add_column :trialapps, :question_one,   :text
    add_column :trialapps, :question_two,   :text
    add_column :trialapps, :question_three, :text
    add_column :trialapps, :question_four,  :text
  end
end
