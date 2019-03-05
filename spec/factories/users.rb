require 'faker'

FactoryBot.define do
  factory :user do |f|
    f.username { Faker::Name.first_name }
    f.age { Faker::Number }
    f.city { Faker::Address.city }
    f.identity { Faker::Boolean }
  end
end