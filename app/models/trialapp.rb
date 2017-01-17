class Trialapp < ApplicationRecord
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :character_name,   presence: true, length: { maximum: 50 }
  validates :server,           presence: true, length: { maximum: 50 }
  LIST_OF_CLASSES = ['Death Knight', 'Demon Hunter', 'Druid', 'Hunter',
                      'Mage', 'Monk', 'Paladin', 'Priest', 'Rogue', 'Shaman',
                      'Warlock', 'Warrior']
                      
  validates :character_class,  presence: true, inclusion: { in: LIST_OF_CLASSES }
  
  validates :spec,             presence: true

end
