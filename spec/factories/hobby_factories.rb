FactoryGirl.define do
  factory :hobby do       
    association :profile, :factory => :profile      
    name Faker::Lorem::words
    description Faker::Lorem::paragraphs
  end
end