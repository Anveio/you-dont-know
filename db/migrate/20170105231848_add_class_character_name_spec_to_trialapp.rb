class AddClassCharacterNameSpecToTrialapp < ActiveRecord::Migration[5.0]
  def change
    add_column :trialapps, :character_name, :string
    add_column :trialapps, :server, :string
    add_column :trialapps, :class, :string
    add_column :trialapps, :spec, :string
  end
end
