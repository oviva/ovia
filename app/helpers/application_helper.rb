module ApplicationHelper
  
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ticketee").join(" - ") unless parts.empty?
      end
    end
  end
  
  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end
  
  def authorized?(permission, thing, &block)
    block.call if can?(permission.to_sym, thing) ||
              current_user.try(:admin?)
    nil
  end
  
  def flash_class(level)
    case level
    when :notice then "alert alert-info"
    when :success then "alert alert-success"
    when :error then "alert alert-error"
    when :alert then "alert alert-error"
    end
  end
end

