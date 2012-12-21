Feature: An authenticated user must be able add/edit his education background

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page
      Given I press on "resume" tab      


    Scenario: User adds a new education background (scenario which works)
      Given I press on "+ Add New School" link
      Then I am redirected to "Add New School" page     
        And I fill in "Name" with "EPITA"
        And I fill in "Field of Study" with "Computer Science"
        And I fill in "Degree obtained" with "Master's Degree"
        And I fill in "City" with "Paris"
        And I fill in "Country" with "FRANCE"
        And I select "September" as start_month school date
        And I select "2006" as start_year school date
        And I select "June" as end_month school date
        And I select "2011" as end_year school date
      When I press "save"
      Then I am redirected to my profile page
        And I should see "EPITA" within "profile_resume_schools" section
        And I should see "Computer Science" within "profile_resume_schools" section
        And I should see "Master's Degree" within "profile_resume_schools" section
        And I should see "September 2006" within "profile_resume_schools" section
        And I should see "June 2011" within "profile_resume_schools" section
        

    Scenario: Users edits an education background (scenario which works)
    Given the following schools are created in the database:
      | name   | field_study | degree  | city         | country       |
      | UCLA   | Management  | MBA     | Los Angeles  | United States |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_schools" section 
    Then I am redirected to "Edit School" page
      And the "Name" field should contain "UCLA"
      And the "Field of Study" field should contain "Management"
      And the "Degree obtained" field should contain "MBA"
      And the "City" field should contain "Los Angeles"
      And the "Country" field should contain "United States"
    Then I fill in "Name" with "EPITA"
      And I fill in "Field of Study" with "Computer Science"
      And I fill in "Degree obtained" with "Master's Degree"
      And I fill in "City" with "Paris"
      And I fill in "Country" with "FRANCE"
      And I select "September" as start_month school date
      And I select "2006" as start_year school date
      And I select "June" as end_month school date
      And I select "2011" as end_year school date
    When I press "save"
    Then I am redirected to my profile page
      And I should see "EPITA" within "profile_resume_schools" section
      And I should see "Computer Science" within "profile_resume_schools" section
      And I should see "Master's Degree" within "profile_resume_schools" section
      And I should see "September 2006" within "profile_resume_schools" section
      And I should see "June 2011" within "profile_resume_schools" section
          
  
    @javascript
    Scenario: User deletes an education background (scenario which works)
      Given the following schools are created in the database:
      | name   | field_study | degree  | city         | country       |
      | UCLA   | Management  | MBA     | Los Angeles  | United States |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Delete" within "profile_resume_schools" section 
    Then I should stay on my profile page     
      And I should not see "UCLA" within "profile_resume_schools" section
      And I should not see "Management" within "profile_resume_schools" section
      And I should not see "MBA" within "profile_resume_schools" section
      And I should not see "Los Angeles" within "profile_resume_schools" section
      And I should not see "United States" within "profile_resume_schools" section
 

    Scenario: User adds a new education background with empty fields (error)
      Given I press on "+ Add New School" link
      Then I am redirected to "Add New School" page
      When I press "save"
      Then I should stay on "Add New School" page
        And I should see "An error has occured." error message
        And I should see "Field cannot be empty." error message


    Scenario: User edits an education background with empty fields (error)
    Given the following schools are created in the database:
      | name   | field_study | degree  | city         | country       |
      | UCLA   | Management  | MBA     | Los Angeles  | United States |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_schools" section 
    Then I am redirected to "Edit School" page
      And I fill in "Name" with ""
      And I fill in "Field of Study" with ""
      And I fill in "Degree obtained" with ""
      And I fill in "City" with ""
      And I fill in "Country" with ""
      And I select "" as end_month school date
      And I select "" as end_year school date
    When I press "save"
    Then I should stay on "Edit School" page
      And I should see "Error while saving the modifications." error message
      And I should see "Field cannot be empty." error message
          