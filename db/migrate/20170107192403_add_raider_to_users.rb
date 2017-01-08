class AddRaiderToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :raider, :boolean, default: false
  end
end
