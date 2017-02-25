module TrialappsHelper
  def viewing_all_applications?
    params[:controller] == 'trialapps' && params[:action] = 'index'
  end
end
