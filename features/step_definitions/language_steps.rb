Then /^I am redirected to "Add New Language" page$/ do
  current_path.should == new_user_profile_language_path(@current_user)
end

Then /^I am redirected to "Edit Language" page$/ do
  current_path.should == edit_user_profile_language_path(@current_user, @edit_language)
end

Then /^I should stay on "Add New Language" page$/ do
  page.should have_content("Add New Language")
end

Then /^I should stay on "Edit Language" page$/ do
  page.should have_content("Edit Language")
end

Given /^the following languages are created in the database:$/ do |language_table|
  language_table.hashes.each do |language| 
    @arguments = {
        name: language[:name],
        level: language[:level],
        additional_information: language[:additional_information]
      }  
    @language = @current_user.profile.languages.build(@arguments)
    @language.save.should == true

    @edit_language = @language
  end  
end
