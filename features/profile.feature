Feature: An authenticated user must be able to edit his profile

    Background:
    Given the following users are created in the database:
      | lastname | firstname | email                   | password      |
      | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
	    | Adams    | Bryan     | bryan.adams@gmail.com   | bryanpassword |
    Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"
    Given I go to my profile page	

    Scenario Outline: User edits his profile (scenario which works)
      Given I press on "edit_profile" link
	    Then I am redirected to "Edit Profile Personal Data" page
  	    And the "Public Link" field should contain "fabricecheng"	
        And I fill in "Phone number" with "<phone>"
        And I fill in "Profesional headline" with "<head_description>"
    		And I fill in "profile_about_me_description" with "<aboutme_description>"
    		And I fill in "profile_search_description" with "<search_description>"
    		And I fill in "Public Link" with "<link>"
        And I attach the file "Fabrice_CHENG_ID_PHOTO.jpg" to "profile_photo"
      When I press "save"
      Then I am redirected to my profile page
        And I should see the image "Fabrice_CHENG_ID_PHOTO"
        And I should see "<phone>" on my profile page
    		And I should see "<head_description>" on my profile page
    		And I should see "<aboutme_description>" on my profile page
    		And I should see "<search_description>" on my profile page
    		And I should see "<link>" on my profile page
  	 Examples:
      |phone        |head_description |link            |aboutme_description 		|search_description  |
      |0033666856547|Web Developer    |newfabricecheng |Neque porro quisquam .. |sum dolor sit amet, consetetur sadipscing ,alitz |

	
  	Scenario: User edits his profile with an existing public link (error)
      Given "bryan.adams@gmail.com" has a profile public link set as "bryanadams"
      Given I press on "edit_profile" link
  	  Then I am redirected to "Edit Profile Personal Data" page
  	    And the "Public Link" field should contain "fabricecheng"
  		  And I fill in "Public Link" with "bryanadams"
      When I press "save"
      Then I should stay on "Edit Profile Personal Data" page
        And I should see "This link has already been taken." error message 	
        And I should see "Error while saving the modifications." error message 


    Scenario: User edits his profile with an empty public link (error)
      Given I press on "edit_profile" link
      Then I am redirected to "Edit Profile Personal Data" page
        And the "Public Link" field should contain "fabricecheng"
        And I fill in "Public Link" with ""
      When I press "save"
      Then I should stay on "Edit Profile Personal Data" page
        And I should see "Error while saving the modifications." error message
        And I should see "Field cannot be empty." error message       
        
	
    Scenario: User access to his public profile - About Me tab (scenario which works)
      Given I press on "view_profile" link
      Then I am redirected to "fabrice.cheng@gmail.com" public profile page
      Given I press on "aboutme" tab
        And I should not see any Add, Edit, View Profile link

    Scenario: User access to his public profile - Resume tab (scenario which works)
      Given I press on "view_profile" link
      Then I am redirected to "fabrice.cheng@gmail.com" public profile page
      Given I press on "resume" tab
        And I should not see any Add, Edit, View Profile link    

 
    Scenario: User with the same lastname and firstname as someone registered in the Database will have a default public link as follow : <firstname><lastname><id>
      Given the following users are created in the database:
        | lastname | firstname | email              | password            |
        | Cheng    | Fabrice   | new.user@gmail.com | new_user_password   |
      Given I log out
      Then I am logged in as "new.user@gmail.com" with password "new_user_password"
        And I go to my profile page 
        And the default public link should equal "fabricecheng<id>"    
