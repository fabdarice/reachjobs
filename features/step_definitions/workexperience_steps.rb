Then /^I am redirected to "Add New Work Experience" page$/ do
  current_path.should == new_user_profile_workexperience_path(@current_user)
end

Then /^I am redirected to "Edit Work Experience" page$/ do
  current_path.should == edit_user_profile_workexperience_path(@current_user, @edit_workexperience)
end      

Then /^I should stay on "Add New Work Experience" page$/ do
  page.should have_content("Add New Work Experience")
end

Then /^I should stay on "Edit Work Experience" page$/ do
  page.should have_content("Edit Work Experience")
end

And /^I select "([^\"]*)" as start_month work date$/ do |select_value|
  page.select select_value, :from => "workexperience_start_date_2i"
end
        
And /^I select "([^\"]*)" as start_year work date$/ do |select_value|
  page.select select_value, :from => "workexperience_start_date_1i"
end

And /^I select "([^\"]*)" as end_month work date$/ do |select_value|
  page.select select_value, :from => "workexperience_end_date_2i"
end

And /^I select "([^\"]*)" as end_year work date$/ do |select_value|
  page.select select_value, :from => "workexperience_end_date_1i"
end

Given /^the following workexperience are created in the database:$/ do |workexperience_table|
  workexperience_table.hashes.each do |workexperience|    
    @arguments = {
      company: workexperience[:company],
      job_title: workexperience[:job_title],
      city: workexperience[:city],
      country: workexperience[:country],
      mission_description: workexperience[:mission_description],
      start_date: Time.now()
    }  
    @workexperience = @current_user.profile.workexperiences.build(@arguments)
    @workexperience.save.should == true
  
    @skill = Skill.new(skill_name: workexperience[:skill_name])
    @workexperience.skills << @skill
    @workexperience.save.should == true
    @edit_workexperience = @workexperience
  end
end
 