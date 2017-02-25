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
end