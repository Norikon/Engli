class NotificationsController < ApplicationController

  def index
    @notifications = PublicActivity::Activity.where(recipient_id: current_user.id).paginate(:page => params[:page], :per_page => 10)
  end

  def read_all
    PublicActivity::Activity.where(recipient_id: current_user.id).update_all({readed: true})
    render :nothing => true
  end

end
