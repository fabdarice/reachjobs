# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :skillcategory do
    category_name 'Front-end'
    #skills { |s| [s.association(:skill)] }
  end
end

FactoryGirl.define do
  factory :skill do
    skill_name 'HTML'
    #skillcategories { |s| s.association(:skill) }
  end
end

