module TrialappsHelper
  def viewing_all_applications?
    params[:controller] == 'trialapps' && params[:action] == 'index'
  end
  
  def trialapp_status(trialapp)
    if trialapp.accepted == true
      "Accepted"
    elsif trialapp.accepted == nil
      "Pending"
    else
      "Declined"
    end
  end
  
  def trialapp_row_class(trialapp)
    if trialapp.accepted == true
      "success"
    elsif trialapp.accepted == false
      "danger"
    else
      "active"
    end
  end
end
