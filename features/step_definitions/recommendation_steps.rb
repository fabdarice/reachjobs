Given /^the following recommendations are created in the database:$/ do |recommendation_table|
    recommendation_table.hashes.each do |recommendation_hash|
		@arguments = {
		:author => recommendation_hash["author"],
		:relation => recommendation_hash["relation"],
		:content => recommendation_hash["content"]
		}
		@recommendation = @current_user.profile.recommendations.build(@arguments)
		@recommendation.save.should == true
		@edit_recommendation = @recommendation
	end
end	  

Then /^I am redirected to "Add New Recommendation" page$/ do
	current_path.should == new_user_profile_recommendation_path(@current_user)
end

Then /^I am redirected to "Edit Recommendation" page$/ do
	current_path.should == edit_user_profile_recommendation_path(@current_user, @edit_recommendation.id)
end	  

	  
Then /^I should stay on "Add New Recommendation" page$/ do
	page.should have_content("Add New Recommendation")
end	


Then /^I should stay on "Edit Recommendation" page$/ do
	page.should have_content("Edit Recommendation")
end 