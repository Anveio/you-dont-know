class AddAcceptedToTrialapps < ActiveRecord::Migration[5.0]
  def change
    change_column :trialapps, :accepted, :boolean
  end
end
