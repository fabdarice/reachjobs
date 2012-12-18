FactoryGirl.define do
  factory :project do       
    association :profile, :factory => :profile      
    name Faker::Lorem::words
    headline Faker::Lorem::words
    description Faker::Lorem::paragraphs
  end
end