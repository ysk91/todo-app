FactoryBot.define do
  factory :user do
    name { 'RSpec_user' }
    email { 'rspec@example.com' }
    password { 'password' }
  end
end