Then /^I am redirected to "Edit Profile Personal Data" page$/ do
  current_path.should == edit_user_profile_path(@current_user)
  page.should have_content("Edit Profile Personal Data")
end

Then /^I should stay on "Edit Profile Personal Data" page$/ do
  page.should have_content("Edit Profile Personal Data")
end

Given /^"([^\"]*)" has a profile public link set as "([^\"]*)"$/ do |email, link|
  @user = User.where(:email => email).first
  @profile = @user.build_profile
  @profile.link = link
  @profile.save.should == true
end


Then /^I am redirected to "([^\"]*)" public profile page$/ do |email|
  @user = User.where(:email => email).first
  current_path.should == root_path + @user.profile.link
end

And /^I should not see any Add, Edit, View Profile link$/ do 
  page.should have_no_selector(:xpath, "//a[@class='add_edit_link']")
  page.should have_no_selector(:xpath, "//a[@id='view_profile']")
end

And /^the default public link should equal "fabricecheng<id>"$/ do
  @user = User.where(:email => "new.user@gmail.com").first
  link = @user.firstname + @user.lastname + @user.id.to_s
  link.downcase!
  page.should have_content(link)
end  