class Trialapp < ApplicationRecord
  belongs_to :user
  
  attr_accessor :accepted
  
  def accept_trial
    self.accepted = true
  end
end
