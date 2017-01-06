class RenameClassColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :trialapps, :class, :character_class
  end
end
