module ApplicationHelper
  def date_formatter(date)
    date.strftime("%a %H %b %Y")
  end
end
