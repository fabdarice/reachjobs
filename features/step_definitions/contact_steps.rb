Given /^I go to the Contact Us page$/ do
  visit new_contacts_path
  page.should have_content("Contact Us")  
end


Then /^I should stay on Contact Us page$/ do
  page.should have_content("Contact Us")
end

And /^an email should have been sent from "([^\"]*)"$/ do |sender|       
  @email = ActionMailer::Base.deliveries.last
  @email.to.should include "fabrice.cheng@gmail.com"
  @email.subject.should include("[ReachJobs] Notification from #{sender}")           
end

And /^an email should not have been sent$/ do
  ActionMailer::Base.deliveries.size.should eq 0
end