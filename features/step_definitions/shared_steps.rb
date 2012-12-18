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

And /^I should see "([^\"]*)" notice message$/ do |message|
  page.should have_content(message)
end

And /^I should see "([^\"]*)" empty$/ do |field|
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  field_value.should == nil
end
        

And /^I should see "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  field = find_field(field)
  field_value = (field.tag_name == 'textarea') ? field.text : field.value
  field_value.should == value
end        