class AddAcceptedToTrialapp < ActiveRecord::Migration[5.0]
  def change
    add_column :trialapps, :accepted, :boolean, default: false
  end
end
