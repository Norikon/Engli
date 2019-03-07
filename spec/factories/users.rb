require 'faker'

FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
  end
  factory :confirmed_user, :parent => :user do
    after(:create) { |user| user.confirm! }
  end
end