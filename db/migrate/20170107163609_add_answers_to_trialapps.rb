class AddAnswersToTrialapps < ActiveRecord::Migration[5.0]
  def change
    add_column :trialapps, :answer_one,   :text
    add_column :trialapps, :answer_two,   :text
    add_column :trialapps, :answer_three, :text
    add_column :trialapps, :answer_four,  :text
  end
end
