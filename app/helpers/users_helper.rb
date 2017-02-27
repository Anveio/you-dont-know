module UsersHelper
  def signing_up?
    params[:controller] == 'users' && params[:action] == 'new'
  end
  
  def viewing_users_index?
    params[:controller] == 'users' && params[:action] == 'index'
  end
  
  def viewing_account_info?
    params[:controller] == 'users' && !params[:action] == 'index'
  end
  
  def user_has_application(user)
    user.trialapps.any? ? "Yes" : "No" 
  end
  
  def role_of_user(user)
    if user.admin?
      "Admin"
    elsif user.officer?
      "Officer"
    elsif user.raider?
      "Raider"
    else
      "New User"
    end
  end
end