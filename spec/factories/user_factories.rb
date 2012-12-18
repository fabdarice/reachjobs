# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email Faker::Internet::email
    password 'UCLADMIN'
    password_confirmation 'UCLADMIN'
    remember_me true
    lastname Faker::Name::last_name
    firstname Faker::Name::first_name
  end
end

 