And /^I press on my gallery avatar$/ do
  visit images_user_profile_gallery_path(@current_user, @edit_gallery)
end

Then /^I am redirected to my images gallery$/ do
  current_path.should == images_user_profile_gallery_path(@current_user, @edit_gallery)
end

And /^I should see "([^\"]*)" on my gallery page$/ do |value|
  page.should have_content(value)
end

And /^I am redirected to "Edit Gallery Images" page$/ do
  current_path.should == edit_images_user_profile_gallery_path(@current_user, @edit_gallery)
end


Then /^I should stay on "Edit Gallery Images" page$/ do
  page.should have_content("GALLERY IMAGES")
  page.should have_content("Add a new picture")
end

Given /^the following pictures are already added to "UltimateForecaster 2012" gallery$/ do |picture_table|
  picture_table.hashes.each do |picture| 
    new_picture = File.new("features/upload-files/" + picture[:picture_file])
    @gallery = Gallery.where(:name => "UltimateForecaster 2012").first
    @picture = @gallery.pictures.build(:avatar => new_picture)
    @gallery.save.should == true
    @edit_picture = @picture
  end  
end


Then /^I press "Edit" below my existing image and attach the file "([^\"]*)"$/ do |file|
  attach_file('edit_picture_avatar', Rails.root.join('features', 'upload-files', file))
end

And /^I should not see the image "([^\"]*)"$/ do |image|
  page.should_not have_xpath("//img[contains(@src, '#{image}')]")
end 

And /^I should not see the image "([^\"]*)" anymore$/ do |image|
  find(:xpath, "//div[@class='one_picture picture_fieldsremovable' and @style='display: none;']").should have_xpath(".//img[contains(@src, '#{image}')]")
end 