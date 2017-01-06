class Trialapp < ApplicationRecord
  belongs_to :user

  validates :character_name, presence: true
  validates :server, presence: true
  validates :character_class, presence: true
  validates :spec, presence: true

end
