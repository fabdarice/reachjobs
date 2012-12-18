Given /^I go to the Contact Us page$/ do
  visit new_contacts_path
  page.should have_content("Your feedback is very important to us. Contact us for any questions, problems or upgrade needs.")  
  page.should have_content("We need your help to improve ReachJobs !")
end


Then /^I should stay on Contact Us page$/ do
  current_path.should == contacts_path
end
        