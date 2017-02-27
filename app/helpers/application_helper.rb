module ApplicationHelper
  
  #Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "You Dont Know"
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
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
