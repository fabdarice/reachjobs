FactoryGirl.define do
  factory :language do       
    association :profile, :factory => :profile      
    name Faker::Lorem::word
	  level Faker::Lorem::words
	  additional_information Faker::Lorem::sentence
  end
end