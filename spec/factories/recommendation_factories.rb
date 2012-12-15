# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recommendation do
    content 'Fabrice has done a great work covering more than 90% of reachjobs project using RSpec for unit testing and Cucumber for Integration testing'
    author 'UCLA Professor'
    relation 'Future boss'
  end
end