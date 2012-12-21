And /^I should see the icon "(.+)"$/ do |icon|
    page.should have_xpath("//img[contains(@src, '/images/#{icon}')]")
end

And /^I should see the link to "(.+)"$/ do |link|
    page.should have_xpath("//a[@href=\"#{link}\"]")
end

And /^I should see the link to download the resume$/ do
	page.should have_content("Download")
end

Then /^I should stay on "Edit Contact Information" page$/ do
	page.should have_content("Edit Contact Information")
end

Then /^I am redirected to "Edit Contact Information" page$/ do
	visit edit_user_profile_socialnetwork_path(@current_user)
end 