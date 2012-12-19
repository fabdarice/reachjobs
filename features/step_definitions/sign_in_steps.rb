Given /^I go to the sign in page$/ do
  visit new_user_session_path
end

Then /^I should stay on the sign in page$/ do
  find_by_id("login_form")
end