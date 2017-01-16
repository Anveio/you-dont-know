class Trialapp < ApplicationRecord
  belongs_to :user
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :character_name,   presence: true, length: { maximum: 50 }
  validates :server,           presence: true, length: { maximum: 50 }
  validates :character_class,  presence: true
  
  validates :spec,             presence: true

end
