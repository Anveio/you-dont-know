ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper
  
  def is_logged_in?
    !session[:user_id].nil?
  end
  
<<<<<<< HEAD
=======
  # Log in as a particular user.
>>>>>>> c4224dda237f17e16d6c2dd7ea91a2564096f0cc
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
<<<<<<< HEAD
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email, 
                                          password: password, 
=======
  def log_in_as(user, password: 'foobarbaz', remember_me: '1')
    post login_path, params: { session: { email: user.email, password: password,
>>>>>>> c4224dda237f17e16d6c2dd7ea91a2564096f0cc
                                          remember_me: remember_me } }
  end
end
