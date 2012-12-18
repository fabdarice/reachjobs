FactoryGirl.define do
  factory :school do       
    association :profile, :factory => :profile      
    start_date Date.new(2006, 9, 1)
    end_date Date.new(20011, 6, 1)
    name Faker::Lorem::words
    city Faker::Address::city
    country Faker::Address::country
    degree Faker::Lorem::words
    field_study Faker::Lorem::words
  end
end