Feature: An authenticated user must be able add/edit his Hobbies skills

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page
      Given I press on "resume" tab      


    Scenario: User adds a new hobby skill (scenario which works)
      Given I press on "+ Add New Hobby" link
      Then I am redirected to "Add New Hobby" page     
        And I fill in "Hobby" with "Sport"
        And I fill in "Description" with "Soccer, Handball"
      When I press "save"
      Then I am redirected to my profile page
        And I should see "Sport" within "profile_resume_hobbies" section
        And I should see "Soccer, Handball" within "profile_resume_hobbies" section
 

    Scenario: Users edits a hobby skill (scenario which works)
    Given the following hobbies are created in the database:
      | name        | description                                                    | 
      | Association | Founder of Crazy Seven, a soccer group composed of 14 members. |   
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_hobbies" section 
    Then I am redirected to "Edit Hobby" page
      And the "Hobby" field should contain "Association"
      And the "Description" field should contain "Founder of Crazy Seven, a soccer group composed of 14 members."
      Then I fill in "Hobby" with "Sport"
        And I fill in "Description" with "Soccer, Handball"
      When I press "save"
      Then I am redirected to my profile page
        And I should see "Sport" within "profile_resume_hobbies" section
        And I should see "Soccer, Handball" within "profile_resume_hobbies" section
 
          
    @javascript
    Scenario: User deletes a hobby skill (scenario which works)
      Given the following hobbies are created in the database:
      | name        | description                                                    | 
      | Association | Founder of Crazy Seven, a soccer group composed of 14 members. |   
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Delete" within "profile_resume_hobbies" section 
    Then I should stay on my profile page     
      And I should not see "Association" within "profile_resume_hobbies" section
      And I should not see "Founder of Crazy Seven, a soccer group composed of 14 members." within "profile_resume_hobbies" section
 

    Scenario: User adds a new hobby skill with empty fields (error)
      Given I press on "+ Add New Hobby" link
      Then I am redirected to "Add New Hobby" page
      When I press "save"
      Then I should stay on "Add New Hobby" page
        And I should see "An error has occured." error message
        And I should see "Field cannot be empty." error message


    Scenario: User edits a hobby skill with empty fields (error)
    Given the following hobbies are created in the database:
      | name        | description                                                    | 
      | Association | Founder of Crazy Seven, a soccer group composed of 14 members. |   
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_hobbies" section 
    Then I am redirected to "Edit Hobby" page
      And I fill in "Hobby" with ""
      And I fill in "Description" with ""
    When I press "save"
    Then I should stay on "Edit Hobby" page
      And I should see "Error while saving the modifications." error message
      And I should see "Field cannot be empty." error message
          