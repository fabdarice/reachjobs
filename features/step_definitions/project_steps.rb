Then /^I am redirected to "Add Personal Project" page$/ do
  current_path.should == new_user_profile_project_path(@current_user)
end

Then /^I am redirected to "Edit Personal Project" page$/ do
  current_path.should == edit_user_profile_project_path(@current_user, @edit_project)
end

Then /^I should stay on "Add Personal Project" page$/ do
  page.should have_content("Add Personal Project")
end

Then /^I should stay on "Edit Personal Project" page$/ do
  page.should have_content("Edit Personal Project")
end

Given /^the following projects are created in the database:$/ do |project_table|
  project_table.hashes.each do |project| 
    @arguments = {
        name: project[:name],
        headline: project[:headline],
        description: project[:description]
      }  
    @project = @current_user.profile.projects.build(@arguments)
    @project.save.should == true
  
    @skill = Skill.new(skill_name: project[:skill_name])
    @project.skills << @skill
    @project.save.should == true
    @edit_project = @project
  end  
end