module NotificationsHelper

  def readed_circle(notification)
    class_name = notification.readed ? 'readed' : ''
    glificon = notification.key == 'Liked your' ? 'glyphicon-thumbs-up' : 'glyphicon-thumbs-down'
    "<span class='glyphicon #{glificon}  notification-item #{class_name}'></span>".html_safe
  end

end