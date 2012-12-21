Feature: An authenticated user must be able add/edit his personal projects

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page
      Given I press on "resume" tab      

    @javascript  
    Scenario: User adds a new personal project (scenario which works)
      Given I press on "+ Add New Project" link
      Then I am redirected to "Add Personal Project" page     
        And I fill in "Project Name" with "ReachJobs"
        And I fill in "Project Headline" with "Free Online Resume and Portfolio"
        And I fill in "Description" with "Create your online profile"
        And I fill in "new_skill" with "Ruby on Rails"
        Then I press on "Button_add" image
          And I wait for the ajax request to finish
          And I should see "Ruby on Rails" within the "list_of_skills_container" field
          And I attach the file "reachjobs_project.png" to "project_avatar"  
      When I press "save"
      Then I am redirected to my profile page
        And I should see the image "reachjobs_project"
        And I should see "REACHJOBS" within "profile_resume_projects" section
        And I should see "Free Online Resume and Portfolio" within "profile_resume_projects" section
        And I should see "Create your online profile" within "profile_resume_projects" section
        And I should see "Ruby on Rails" within "profile_resume_projects" section

    @javascript    
    Scenario: Users edits a personal project (scenario which works)
    Given the following projects are created in the database:
      | name                    | headline         | description        | skill_name |
      | UltimateForecaster 2012 | Bet on Euro 2012 | Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012. | HTML |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_projects" section 
    Then I am redirected to "Edit Personal Project" page
      And the "Project Name" field should contain "UltimateForecaster 2012"
      And the "Project Headline" field should contain "Bet on Euro 2012"
      And the "Description" field should contain "Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012."
      And I should see "HTML" within the "list_of_skills_container" field
    Then I fill in "Project Name" with "ReachJobs"
      And I fill in "Project Headline" with "Free Online Resume and Portfolio"
      And I fill in "Description" with "Create your online profile"
      And I fill in "new_skill" with "Ruby on Rails"
      Then I press on "Button_add" image
        And I wait for the ajax request to finish
        And I should see "Ruby on Rails" within the "list_of_skills_container" field
        And I attach the file "reachjobs_project.png" to "project_avatar"
    When I press "save"
    Then I am redirected to my profile page
      And I should see the image "reachjobs_project"
      And I should see "REACHJOBS" within "profile_resume_projects" section
      And I should see "Free Online Resume and Portfolio" within "profile_resume_projects" section
      And I should see "Create your online profile" within "profile_resume_projects" section
      And I should see "Ruby on Rails" within "profile_resume_projects" section
  
    @javascript
    Scenario: User deletes a personal project (scenario which works)
      Given the following projects are created in the database:
      | name                    | headline         | description        | skill_name |
      | UltimateForecaster 2012 | Bet on Euro 2012 | Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012. | HTML |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Delete" within "profile_resume_projects" section 
    Then I should stay on my profile page     
      And I should not see "UltimateForecaster 2012" within "profile_resume_projects" section
      And I should not see "Bet on Euro 2012" within "profile_resume_projects" section
      And I should not see "Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012." within "profile_resume_projects" section
      And I should not see "HTML" within "profile_resume_projects" section
 

    Scenario: User adds a new personal project with empty fields (error)
      Given I press on "+ Add New Project" link
      Then I am redirected to "Add Personal Project" page
      When I press "save"
      Then I should stay on "Add Personal Project" page
        And I should see "An error has occured." error message
        And I should see "Field cannot be empty." error message


    Scenario: User edits a personal project with empty fields (error)
    Given the following projects are created in the database:
      | name                    | headline         | description        | skill_name |
      | UltimateForecaster 2012 | Bet on Euro 2012 | Ultimate Forecaster 2012 is a betting web site created for UEFA Euro 2012. | HTML |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_projects" section 
    Then I am redirected to "Edit Personal Project" page
      And I fill in "Project Name" with ""
      And I fill in "Project Headline" with ""
      And I fill in "Description" with ""
    When I press "save"
    Then I should stay on "Edit Personal Project" page
      And I should see "Error while saving the modifications." error message
      And I should see "Field cannot be empty." error message
          