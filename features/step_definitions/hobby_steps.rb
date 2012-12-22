Then /^I am redirected to "Add New Hobby" page$/ do
  current_path.should == new_user_profile_hobby_path(@current_user)
end

Then /^I am redirected to "Edit Hobby" page$/ do
  current_path.should == edit_user_profile_hobby_path(@current_user, @edit_hobby)
end

Then /^I should stay on "Add New Hobby" page$/ do
  page.should have_content("Add New Hobby")
end

Then /^I should stay on "Edit Hobby" page$/ do
  page.should have_content("Edit Hobby")
end

Given /^the following hobbies are created in the database:$/ do |hobby_table|
  hobby_table.hashes.each do |hobby| 
    @arguments = {
        name: hobby[:name],
        description: hobby[:description]
      }  
    @hobby = @current_user.profile.hobbies.build(@arguments)
    @hobby.save.should == true

    @edit_hobby = @hobby
  end  
end
