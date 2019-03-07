require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:user) { FactoryBot.create(:user, username: 'Main4650', age: '32', city: 'London', identity: true, password: '123456789', password_confirmation: '123456789') }
  before(:each) do
    user.confirm
    sign_in user
  end

  it "should get index" do
    get 'index'
    expect(response.status).to eq(200)
  end
end
