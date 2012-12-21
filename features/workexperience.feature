Feature: An authenticated user must be able add/edit his work experience

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page
      Given I press on "resume" tab      

    @javascript  
    Scenario: User adds a new work experience (scenario which works)
      Given I press on "+ Add New Experience" link
      Then I am redirected to "Add New Work Experience" page     
        And I fill in "Company" with "University College Dublin"
        And I fill in "Position occupied" with "Web Developer"
        And I fill in "City" with "Paris"
        And I fill in "Country" with "FRANCE"
        And I select "September" as start_month work date
        And I select "2009" as start_year work date
        And I select "February" as end_month work date
        And I select "2010" as end_year work date
        And I fill in "Description" with "Developer at UCD working on Uniprime web service."
        And I fill in "new_skill" with "Ruby on Rails"
        Then I press on "Button_add" image
          And I wait for the ajax request to finish
          And I should see "Ruby on Rails" within the "list_of_skills_container" field
          And I attach the file "UCD_logo.png" to "workexperience_avatar"  
      When I press "save"
      Then I am redirected to my profile page
        And I should see the image "UCD_logo"
        And I should see "UNIVERSITY COLLEGE DUBLIN" within "profile_resume_workexperiences" section
        And I should see "Web Developer" within "profile_resume_workexperiences" section
        And I should see "Paris" within "profile_resume_workexperiences" section
        And I should see "FRANCE" within "profile_resume_workexperiences" section
        And I should see "September 2009" within "profile_resume_workexperiences" section
        And I should see "February 2010" within "profile_resume_workexperiences" section
        And I should see "Developer at UCD working on Uniprime web service." within "profile_resume_workexperiences" section
        And I should see "Ruby on Rails" within "profile_resume_workexperiences" section

    @javascript    
    Scenario: Users edits a work experience (scenario which works)
    Given the following workexperience are created in the database:
      | company      | job_title      | city        | country       | mission_description            | skill_name |
      | STERIA       | Lead Developer | Los Angeles | United States | Lead Developer in a small team | HTML       |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_workexperiences" section 
    Then I am redirected to "Edit Work Experience" page
      And the "Company" field should contain "STERIA"
      And the "Position" field should contain "Lead Developer"
      And the "City" field should contain "Los Angeles"
      And the "Country" field should contain "United States"
      And the "Description" field should contain "Lead Developer in a small team"
      And I should see "HTML" within the "list_of_skills_container" field
    Then I fill in "Company" with "University College Dublin"
      And I fill in "Position occupied" with "Web Developer"
      And I fill in "City" with "Paris"
      And I fill in "Country" with "FRANCE"
      And I select "September" as start_month work date
      And I select "2009" as start_year work date
      And I select "February" as end_month work date
      And I select "2010" as end_year work date
      And I fill in "Description" with "Developer at UCD working on Uniprime web service."
      And I fill in "new_skill" with "Ruby on Rails"
      Then I press on "Button_add" image
        And I wait for the ajax request to finish
        And I should see "Ruby on Rails" within the "list_of_skills_container" field
        And I attach the file "UCD_logo.png" to "workexperience_avatar"  
    When I press "save"
    Then I am redirected to my profile page
      And I should see the image "UCD_logo"
      And I should see "UNIVERSITY COLLEGE DUBLIN" within "profile_resume_workexperiences" section
      And I should see "Web Developer" within "profile_resume_workexperiences" section
      And I should see "Paris" within "profile_resume_workexperiences" section
      And I should see "FRANCE" within "profile_resume_workexperiences" section
      And I should see "September 2009" within "profile_resume_workexperiences" section
      And I should see "February 2010" within "profile_resume_workexperiences" section
      And I should see "Developer at UCD working on Uniprime web service." within "profile_resume_workexperiences" section
      And I should see "Ruby on Rails" within "profile_resume_workexperiences" section
      And I should see "HTML" within "profile_resume_workexperiences" section
  
    @javascript
    Scenario: User deletes a skill category (scenario which works)
      Given the following workexperience are created in the database:
      | company      | job_title      | city        | country       | mission_description            | skill_name |
      | STERIA       | Lead Developer | Los Angeles | United States | Lead Developer in a small team | HTML       |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Delete" within "profile_resume_workexperiences" section 
    Then I should stay on my profile page     
      And I should not see "STERIA" within "profile_resume_workexperiences" section
      And I should not see "Lead Developer" within "profile_resume_workexperiences" section
      And I should not see "Los Angeles" within "profile_resume_workexperiences" section
      And I should not see "United States" within "profile_resume_workexperiences" section
      And I should not see "Lead Developer in a small team" within "profile_resume_workexperiences" section
      And I should not see "HTML" within "profile_resume_workexperiences" section
 

    Scenario: User adds a new work experience with empty fields (error)
      Given I press on "+ Add New Experience" link
      Then I am redirected to "Add New Work Experience" page
      When I press "save"
      Then I should stay on "Add New Work Experience" page
        And I should see "An error has occured." error message
        And I should see "Field cannot be empty." error message


    Scenario: User edits a work experience with empty fields (error)
    Given the following workexperience are created in the database:
      | company      | job_title      | city        | country       | mission_description            | skill_name |
      | STERIA       | Lead Developer | Los Angeles | United States | Lead Developer in a small team | HTML       |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_workexperiences" section 
    Then I am redirected to "Edit Work Experience" page 
      And I fill in "Company" with ""
      And I fill in "Position occupied" with ""
      And I fill in "City" with ""
      And I fill in "Country" with ""
      And I select "" as end_month work date
      And I select "" as end_year work date
      And I fill in "Description" with ""
    When I press "save"
    Then I should stay on "Edit Work Experience" page
      And I should see "Error while saving the modifications." error message
      And I should see "Field cannot be empty." error message
          