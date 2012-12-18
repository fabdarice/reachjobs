# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recommendation do
    association :profile, :factory => :profile
    content Faker::Lorem::paragraphs
    author Faker::Name::name
    relation Faker::Lorem::words
  end
end