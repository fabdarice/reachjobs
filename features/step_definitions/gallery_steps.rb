Then /^I am redirected to "Add New Gallery" page$/ do
  current_path.should == new_user_profile_gallery_path(@current_user)
end

Then /^I am redirected to "Edit Gallery" page$/ do
  current_path.should == edit_user_profile_gallery_path(@current_user, @edit_gallery)
end

Then /^I should stay on "Add New Gallery" page$/ do
  page.should have_content("Add New Gallery")
end

Then /^I should stay on "Edit Gallery" page$/ do
  page.should have_content("Edit Gallery")
end

Given /^the following galleries are created in the database:$/ do |gallery_table|
  gallery_table.hashes.each do |gallery| 
    gallery_image = File.new("features/upload-files/" + gallery[:avatar])
    @arguments = {
        name: gallery[:name],
        headline: gallery[:headline],
        description: gallery[:description],
        avatar: gallery_image
      }  
    @gallery = @current_user.profile.galleries.build(@arguments)
    @gallery.save.should == true
  
    @skill = Skill.new(skill_name: gallery[:skill_name])
    @gallery.skills << @skill
    @gallery.save.should == true
    @edit_gallery = @gallery
  end  
end


And /^I should see maximum 130 characters of the following description "([^\"]*)" within "([^\"]*)" section$/ do |description, section|
  within("##{section}") {page.should have_content(description.truncate(130))}
end

And /^I should not see any Add, Edit or Delete link on my public gallery page$/ do
  page.should_not have_content("Edit")
  page.should_not have_content("Add")
  page.should_not have_content("Delete")
end

And /^I should not see "Edit Image Gallery" button$/ do
  page.should_not have_content("Edit Image Gallery")
end