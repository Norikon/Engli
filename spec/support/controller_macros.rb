module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user, password: '123456789', password_confirmation: '123456789')
      sign_in user
    end
  end
end