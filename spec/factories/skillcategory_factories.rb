# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skillcategory do
    association :profile, :factory => :profile
    category_name Faker::Lorem::words
    #skills { |s| [s.association(:skill)] }
  end
end

FactoryGirl.define do
  factory :skill do
    skill_name Faker::Lorem::words
    #skillcategories { |s| s.association(:skill) }
  end
end

