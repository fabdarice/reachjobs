Given /^I go to the register page$/ do
  visit new_user_registration_path
  page.should have_content("Register below and create your free online resume and portfolio")
end

Then /^I am redirected to register page$/ do
  visit new_user_registration_path
end

Then /^I should stay on register page$/ do
  current_path = new_user_registration_path
  #page.should have_content("Register below and create your free online resume and portfolio")
end

And /^I should see "([^\"]*)" on the home page$/ do |user_email|
  page.should have_content(user_email)
end

And /^I should be signed in$/ do
  page.should have_content("Sign out")
end

And /^I should not be signed in$/ do
  page.should have_content("Sign in")
end


Given /^a user with email "([^\"]*)" already exists$/ do |email|
  User.create!({
    lastname: "Toto",
    firstname: "Tata",
    password: "mypassword",
    password_confirmation: "mypassword",
    email: email      
  })
end