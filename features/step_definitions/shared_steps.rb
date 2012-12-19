And /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in field, :with => value
end

When /^I press "([^\"]*)"$/ do |button|
  click_button button
end


Given /^I press on "([^\"]*)" link$/ do |link|
  click_link link
end

Then /^I am redirected to home page$/ do
  current_path.should == root_path
end

And /^I should see "([^\"]*)" error message$/ do |errormsg|
  page.should have_content(errormsg)
end

And /^I should see "([^\"]*)" notice message$/ do |message|
  page.should have_content(message)
end

And /^I should see "([^\"]*)" empty$/ do |field|
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  field_value.should == nil
end
        

And /^the "([^\"]*)" field should contain "([^\"]*)"$/ do |field, value|
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  field_value.should == value
end        


Given /^the following users are created in the database:$/ do |users_table|
  # Initialize the user tables with examples
  users_table.hashes.each do |user_hash|
    lastname = user_hash["lastname"]
    firstname = user_hash["firstname"]
    password = user_hash["password"]
    email = user_hash["email"]
    @user = User.create({
      lastname: lastname,
      firstname: firstname,
      password: password,
      password_confirmation: password,
      email: email
    })
    @user.should be_valid
  end
end 


Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |email, password|
  visit new_user_session_path
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "sign_in"
  current_path.should == root_path
  @current_user = User.where(:email => email).first
end  

Given /^I log out$/ do
  visit destroy_user_session_path
end

Given /^I go to my profile page$/ do
  visit show_edit_user_profile_path(@current_user)
end 

Then /^I am redirected to my profile page$/ do
  current_path.should == show_edit_user_profile_path(@current_user)   
end

And /^I should see the "([^\"]*)" on my profile page$/ do |content|
  page.should have_content(content)
end

