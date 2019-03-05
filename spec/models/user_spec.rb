require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid username" do
    FactoryBot.build(:user, username: nil).should_not be_valid
  end
  it "has a valid age" do
    FactoryBot.build(:user, age: nil).should_not be_valid
  end
  it "has a valid city" do
    FactoryBot.build(:user, city: nil).should_not be_valid
  end
  it "has a valid identity" do
    FactoryBot.build(:user, identity: nil).should_not be_valid
  end
end
