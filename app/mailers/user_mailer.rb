class UserMailer < ApplicationMailer
  default from: 'testsmtpmailforengli@gmail.com'

  def five_like(user)
    @user = user
    @url  = 'localhost:3000/notifications/'
    mail(to: @user.email, subject: 'Users activity for your phrases or examples')
  end

end
