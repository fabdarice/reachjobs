FactoryGirl.define do
  factory :socialnetwork do       
    association :profile, :factory => :profile      
    twitter_link Faker::Internet::url
  	facebook_link Faker::Internet::url
  	linkedin_link Faker::Internet::url
  	viadeo_link Faker::Internet::url
  	reachjobs_link Faker::Internet::url
  end
end