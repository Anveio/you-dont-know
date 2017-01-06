class Trialapp < ApplicationRecord
  belongs_to :user
  has_many :entries
  
  default_scope -> { order(created_at: :desc) }
  
  attr_accessor :spec
  
  validates :user_id, presence: true
  validates :character_name,   presence: true
  validates :server,           presence: true
  validates :character_class,  presence: true
  validates :spec,             presence: true

end
