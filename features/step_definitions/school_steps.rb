Then /^I am redirected to "Add New School" page$/ do
  current_path.should == new_user_profile_school_path(@current_user)
end

Then /^I am redirected to "Edit School" page$/ do
  current_path.should == edit_user_profile_school_path(@current_user, @edit_school)
end

Then /^I should stay on "Add New School" page$/ do
  page.should have_content("Add New School")
end

Then /^I should stay on "Edit School" page$/ do
  page.should have_content("Edit School")
end

Given /^the following schools are created in the database:$/ do |school_table|
  school_table.hashes.each do |school| 
    @arguments = {
        name: school[:name],
        degree: school[:degree],
        field_study: school[:field_study],
        city: school[:city],
        country: school[:country],
        start_date: Time.now()
      }  
    @school = @current_user.profile.schools.build(@arguments)
    @school.save.should == true

    @edit_school = @school
  end  
end

And /^I select "([^\"]*)" as start_month school date$/ do |select_value|
  page.select select_value, :from => "school_start_date_2i"
end
        
And /^I select "([^\"]*)" as start_year school date$/ do |select_value|
  page.select select_value, :from => "school_start_date_1i"
end

And /^I select "([^\"]*)" as end_month school date$/ do |select_value|
  page.select select_value, :from => "school_end_date_2i"
end

And /^I select "([^\"]*)" as end_year school date$/ do |select_value|
  page.select select_value, :from => "school_end_date_1i"
end