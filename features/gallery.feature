Feature: An authenticated user must be able add/edit his personal galleries

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page
      Given I press on "portfolio" tab

    @javascript  
    Scenario: User adds a new image gallery (scenario which works)
      Given I press on "+ Add New Gallery" link
      Then I am redirected to "Add New Gallery" page     
        And I fill in "Gallery Name" with "ReachJobs"
        And I fill in "Headline" with "Online Resume and Portfolio Creator"
        And I fill in "Description" with "ReachJobs offers a simple and customize way to display your assets when applying for a job, a position or to have a reference online."
        And I fill in "new_skill" with "Ruby on Rails"
        Then I press on "Button_add" image
          And I wait for the ajax request to finish
          And I should see "Ruby on Rails" within the "list_of_skills_container" field
          And I attach the file "reachjobs_gallery.png" to "gallery_avatar"  
      When I press "save"
      Then I am redirected to my profile page
        And I should see the image "reachjobs_gallery"
        And I should see "ReachJobs" within "list_galleries" section
        And I should see "Online Resume and Portfolio Creator" within "list_galleries" section
        And I should see maximum 130 characters of the following description "ReachJobs offers a simple and customize way to display your assets when applying for a job, a position or to have a reference online." within "list_galleries" section
        And I should see "Ruby on Rails" within "list_galleries" section

    @javascript    
    Scenario: Users edits his image gallery (scenario which works)
    Given the following galleries are created in the database:
      | name                    | headline         | description    | avatar  | skill_name |
      | UltimateForecaster 2012 | Bet on Euro 2012 | Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012. | reachjobs_gallery.png  | HTML |
    Given I go to my profile page
    Given I press on "portfolio" tab  
    Given I press "Edit" within "list_galleries" section 
    Then I am redirected to "Edit Gallery" page
      And the "Gallery Name" field should contain "UltimateForecaster 2012"
      And the "Headline" field should contain "Bet on Euro 2012"
      And the "Description" field should contain "Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012."
      And I should see "HTML" within the "list_of_skills_container" field
    Then I fill in "Gallery Name" with "ReachJobs"
      And I fill in "Headline" with "Online Resume and Portfolio Creator"
      And I fill in "Description" with "ReachJobs offers a simple and customize way to display your assets when applying for a job, a position or to have a reference online."
      And I fill in "new_skill" with "Ruby on Rails"
      Then I press on "Button_add" image
        And I wait for the ajax request to finish
        And I should see "Ruby on Rails" within the "list_of_skills_container" field
        And I attach the file "reachjobs_gallery.png" to "gallery_avatar"  
    When I press "save"
    Then I am redirected to my profile page
      And I should see the image "reachjobs_gallery"
      And I should see "ReachJobs" within "list_galleries" section
      And I should see "Online Resume and Portfolio Creator" within "list_galleries" section
      And I should see maximum 130 characters of the following description "ReachJobs offers a simple and customize way to display your assets when applying for a job, a position or to have a reference online." within "list_galleries" section
      And I should see "Ruby on Rails" within "list_galleries" section
      And I should see "HTML" within "list_galleries" section
  

    @javascript
    Scenario: User deletes his image gallery (scenario which works)
      Given the following galleries are created in the database:
      | name                    | headline         | description    | avatar   | skill_name |
      | UltimateForecaster 2012 | Bet on Euro 2012 | Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012. | reachjobs_gallery.png  | HTML |
    Given I go to my profile page
    Given I press on "portfolio" tab  
    Given I press "Delete" within "list_galleries" section 
    Then I should stay on my profile page     
      And I should not see "UltimateForecaster 2012" within "list_galleries" section
      And I should not see "Bet on Euro 2012" within "list_galleries" section
      And I should not see "Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012." within "list_galleries" section
      And I should not see "HTML" within "list_galleries" section
 

    Scenario: User adds a new image gallery with empty fields (error)
      Given I press on "+ Add New Gallery" link
      Then I am redirected to "Add New Gallery" page
      When I press "save"
      Then I should stay on "Add New Gallery" page
        And I should see "An error has occured." error message
        And I should see "Field cannot be empty." error message
        

    Scenario: User edits his image gallery with empty fields (error)
    Given the following galleries are created in the database:
      | name                    | headline         | description    | avatar   | skill_name |
      | UltimateForecaster 2012 | Bet on Euro 2012 | Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012. | reachjobs_gallery.png  | HTML |
    Given I go to my profile page
    Given I press on "portfolio" tab  
    Given I press "Edit" within "list_galleries" section 
    Then I am redirected to "Edit Gallery" page
      And I fill in "Gallery Name" with ""
      And I fill in "Headline" with ""
      And I fill in "Description" with ""
    When I press "save"
    Then I should stay on "Edit Gallery" page
      And I should see "Error while saving the modifications." error message
      And I should see "Field cannot be empty." error message
          

    @javascript
    Scenario: User access to his public profile to visualize his image gallery (scenario which works)
    Given the following galleries are created in the database:
      | name                    | headline         | description    | avatar   | skill_name |
      | UltimateForecaster 2012 | Bet on Euro 2012 | Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012. | reachjobs_gallery.png  | HTML |
    Given I press on "view_profile" link
      Then I am redirected to "fabrice.cheng@gmail.com" public profile page
      Then I press on "portfolio" tab
        And I should not see any Add, Edit or Delete link on my public gallery page
      Then I press on "reachjobs_gallery" image
        And I should not see "Edit Image Gallery" button
