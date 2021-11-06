FactoryBot.define do
  factory :user do
    name { 'testuser' }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end