Given /^the following recommendations are created in the database:$/ do |recommendation_table|
    recommendation_table.hashes.each do |recommendation_hash|
		@arguments = {
		:author => recommendation_hash["author"],
		:relation => recommendation_hash["relation"],
		:content => recommendation_hash["content"]
		}
		@recommendation = @current_user.profile.recommendations.build(@arguments)
		@recommendation.save.should == true
	end
end	  

Then /^I am redirected to "Add New Recommendation" page$/ do
	current_path.should == new_user_profile_recommendation_path(@current_user)
end

Then /^I am redirected to "Edit Recommendation" page$/ do
	current_path.should == edit_user_profile_recommendation_path(@current_user, @edit_recommendation.id)
end	  

Given /^I press "Edit" for "([^\"]*)" recommendation$/ do |author|		
	@edit_recommendation = Recommendation.where(:author => author).first
	click_on("edit_recommendation_#{@edit_recommendation.id}") 
	
end
	  
Given /^I press "Delete" for "([^\"]*)" recommendation$/ do |author|
	@delete_recommendation = Recommendation.where(:author => author).first
	page.evaluate_script('window.confirm = function() { return true; }')
	click_on("delete_recommendation_#{@delete_recommendation.id}")
end	  
	  
Then /^I should stay on "Add New Recommendation" page$/ do
	page.should have_content("Add New Recommendation")
end	


Then /^I should stay on "Edit Recommendation" page$/ do
	page.should have_content("Edit Recommendation")
end 