module ApplicationHelper
  def date_formatter(date)
    date.strftime("%a %d %b %Y")
  end

  def flash_class(level)
    case level
    when 'notice' then "alert-success"
    when 'success' then "alert-success"
    when 'error' then "alert-danger"
    when 'alert' then "alert-danger"
    end
  end
end
