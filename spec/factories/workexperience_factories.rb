FactoryGirl.define do
  factory :workexperience do       
    association :profile, :factory => :profile      
    start_date Date.new(2011, 1, 1)
    end_date Date.today
    company Faker::Company::name
    city Faker::Address::city
    country Faker::Address::country
    job_title Faker::Lorem::words
    mission_title Faker::Lorem::words
    mission_description Faker::Lorem::paragraphs
  end
end