class User < ApplicationRecord
<<<<<<< HEAD
  attr_accessor :remember_token
  
=======
    attr_accessor :remember_token
    
>>>>>>> c4224dda237f17e16d6c2dd7ea91a2564096f0cc
    before_save { self.email = email.downcase }
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEXP}, uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, presence: true, length: {minimum: 6 }, allow_nil: true
    
  def self.digest(string)
<<<<<<< HEAD
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
=======
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
>>>>>>> c4224dda237f17e16d6c2dd7ea91a2564096f0cc
    BCrypt::Password.create(string, cost: cost)
  end
  
  def self.new_token
<<<<<<< HEAD
    SecureRandom.urlsafe_base64
  end
  
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
=======
      SecureRandom.urlsafe_base64
  end
  
  def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
>>>>>>> c4224dda237f17e16d6c2dd7ea91a2564096f0cc
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
<<<<<<< HEAD
=======
  
  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    remember_digest.nil? ? false : BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
>>>>>>> c4224dda237f17e16d6c2dd7ea91a2564096f0cc
end
