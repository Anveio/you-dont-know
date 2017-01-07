class Trialapp < ApplicationRecord
  belongs_to :user
  
  
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :character_name,   presence: true
  validates :server,           presence: true
  validates :character_class,  presence: true
  validates :spec,             presence: true
  #validates :answer_one,       presence: true
  #validates :answer_two,       presence: true
  #validates :answer_three,     presence: true
  #validates :answer_four,      presence: true

end
