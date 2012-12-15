# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'fabrice.cheng@gmail.com'
    password 'UCLADMIN'
    password_confirmation 'UCLADMIN'
    remember_me true
    lastname 'Cheng'
    firstname 'Fabrice'
  end
end

 