module ApplicationHelper
  
  
  def title
    base_title = "Ovia"
    if @title.nil?
    base_title
    else
    "#{base_title} | #{@title}"
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

