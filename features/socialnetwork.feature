Feature: An authenticated user must be able to edit his contact information

    Background:
    Given the following users are created in the database:
      | lastname | firstname | email                   | password      |
      | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
    Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
    Given I go to my profile page	

    Scenario Outline: User edits his contact information and uploads his resume (scenario which works)
      Given I press on "edit_contact_me" link
	    Then I am redirected to "Edit Contact Information" page	    
        And I fill in "socialnetwork_linkedin_link" with "<linkedin_link>"
        And I fill in "socialnetwork_viadeo_link" with "<viadeo_link>"
    		And I fill in "socialnetwork_twitter_link" with "<twitter_link>"
    		And I fill in "socialnetwork_facebook_link" with "<facebook_link>"
    		And I fill in "socialnetwork_reachjobs_link" with "<reachjobs_link>"
    		And I attach the resume "FabriceCheng_Resume_WebDeveloper.pdf" to "socialnetwork_resume"
	    When I press "save"
      Then I am redirected to my profile page
        And I should see the image "FabriceCheng_Resume_WebDeveloper"      
    		And I should see the link to download the resume
    		And I should see the icon "ico_linkedin.png"
    		And I should see the icon "ico_viadeo.png"
    		And I should see the icon "ico_twitter.png"
    		And I should see the icon "ico_facebook.png"
    		And I should see the icon "ico_reachjobs.png"		
    		And I should see the link to "<linkedin_link>"
    		And I should see the link to "<viadeo_link>"	
    		And I should see the link to "<twitter_link>"
    		And I should see the link to "<facebook_link>"	
    		And I should see the link to "<reachjobs_link>"
  	Examples:
      |linkedin_link                    |viadeo_link                     |twitter_link                    |facebook_link                     | reachjobs_link 				   |
      |http://linkedin.com/fabricecheng | http://viadeo.com/fabricecheng |http://twitter.com/fabricecheng | http://facebook.com/fabricecheng | http://reachjobs.net/fabricecheng |

	
	Scenario: User tries to upload an invalid resume, wrong format type (error)
      Given I press on "edit_contact_me" link
	  Then I am redirected to "Edit Contact Information" page	    
		And I attach the resume "wrong.bmp" to "socialnetwork_resume"
	  When I press "save"
      Then I should stay on "Edit Contact Information" page
		And I should see "Error while saving the modifications." error message
		And I should see "File type is not allowed (only jpg/png/pdf)." error message
		

		
