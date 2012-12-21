Then /^I am redirected to "Add Skills" page$/ do
  current_path.should == new_user_profile_skillcategory_path(@current_user)
end 

Then /^I am redirected to "Edit Skills" page$/ do
  current_path.should == edit_user_profile_skillcategory_path(@current_user, @edit_skill_category)
end      


Then /^I should stay on "Add Skills" page$/ do
  page.should have_content("Add Skills")
end

Then /^I should stay on "Edit Skills" page$/ do
  page.should have_content("Edit Skills")
end

Given /^the following skillcategory are created in the database:$/ do |skillcategory_table|
    skillcategory_table.hashes.each do |skillcategory_hash|
    
    @skillcategory = Skillcategory.where(category_name: skillcategory_hash[:category_name]).first
    if @skillcategory.nil? 
      @skillcategory = @current_user.profile.skillcategories.build({category_name: skillcategory_hash[:category_name]})
      @skillcategory.save.should == true
    end

    @skill = Skill.new(skill_name: skillcategory_hash[:skill_name])
    @skillcategory.skills << @skill
    @skillcategory.save.should == true
    @edit_skill_category = @skillcategory
  end
end   
