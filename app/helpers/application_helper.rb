module ApplicationHelper
  def date_formatter(date)
    date.strftime("%A %H %b %Y")
  end
end
