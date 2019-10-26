module ApplicationHelper

  def mobile_device
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/
    return "desktop"
  end

  def flash_class(level)
    case level
      when :notice then "alert alert-info alert-dismissible fade show"
      when :success then "alert alert-success alert-dismissible fade show"
      when :error then "alert alert-danger-light alert-dismissible fade show"
      when :alert then "alert alert-error alert-dismissible fade show"
      when :danger then "alert alert-danger-light alert-dismissible fade show"
    end
  end
  
end
