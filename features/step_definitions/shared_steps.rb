And /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in field, :with => value
end

When /^I press "([^\"]*)"$/ do |button|
    click_button "click_#{button}"
    #find("input[src='/images/button_#{button}']").click
end

Then /^I am redirected to home page$/ do
  visit root_path
  page.should have_content("Create Your Online Profile in 3 Steps")
end

And /^I should see "([^\"]*)" error message$/ do |errormsg|
  page.should have_content(errormsg)
end