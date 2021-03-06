
class User::RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:user).permit(:username, :age, :identity, :city, :email, :password, :password_confirmation)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :identity, :age, :city)
  end

end
