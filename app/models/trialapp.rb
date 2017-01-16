class Trialapp < ApplicationRecord
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :character_name,   presence: true, length: { maximum: 50 }
  validates :server,           presence: true
  validates :character_class,  presence: true
  #VALID_CHARACTER_CLASS_REGEXP = /Death Knight|DemonHunter|Druid|Hunter|Mage|Monk|Paladin|Priest|Rogue|Shaman|Warlock|Warrior/

  validates :spec,             presence: true

end
