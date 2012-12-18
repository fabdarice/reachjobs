# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :profile do
    association :user, :factory => :user      
    link Faker::Internet::url
    head_description Faker::Lorem::words
    second_description Faker::Lorem::words
    about_me_description Faker::Lorem::paragraphs
    search_description Faker::Lorem::paragraphs
    phone Faker::PhoneNumber::phone_number
  end
end