Feature: An authenticated user must be able add/edit his Languages skills

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page
      Given I press on "resume" tab      


    Scenario: User adds a new language skill (scenario which works)
      Given I press on "+ Add New Language" link
      Then I am redirected to "Add New Language" page     
        And I fill in "Language" with "French"
        And I fill in "Level" with "Native"
        And I fill in "Additional information" with "Born and lived 18 years."
      When I press "save"
      Then I am redirected to my profile page
        And I should see "French" within "profile_resume_languages" section
        And I should see "Native" within "profile_resume_languages" section
        And I should see "Born and lived 18 years." within "profile_resume_languages" section


    Scenario: Users edits a language skill (scenario which works)
    Given the following languages are created in the database:
      | name      | level   | additional_information   | 
      | English   | Fluent  | Spent 6 months in Dublin | 
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_languages" section 
    Then I am redirected to "Edit Language" page
      And the "Language" field should contain "English"
      And the "Level" field should contain "Fluent"
      And the "Additional information" field should contain "Spent 6 months in Dublin"
      Then I fill in "Language" with "French"
        And I fill in "Level" with "Native"
        And I fill in "Additional information" with "Born and lived 18 years."
    When I press "save"
    Then I am redirected to my profile page
      And I should see "French" within "profile_resume_languages" section
      And I should see "Native" within "profile_resume_languages" section
      And I should see "Born and lived 18 years." within "profile_resume_languages" section
          
  
    @javascript
    Scenario: User deletes a language skill (scenario which works)
      Given the following languages are created in the database:
      | name      | level   | additional_information   | 
      | English   | Fluent  | Spent 6 months in Dublin | 
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Delete" within "profile_resume_languages" section 
    Then I should stay on my profile page     
      And I should not see "ENGLISH" within "profile_resume_languages" section
      And I should not see "FLUENT" within "profile_resume_languages" section
      And I should not see "Spent 6 months in Dublin" within "profile_resume_languages" section
 

    Scenario: User adds a new language skill with empty fields (error)
      Given I press on "+ Add New Language" link
      Then I am redirected to "Add New Language" page
      When I press "save"
      Then I should stay on "Add New Language" page
        And I should see "An error has occured." error message
        And I should see "Field cannot be empty." error message


    Scenario: User edits a language skill with empty fields (error)
    Given the following languages are created in the database:
      | name      | level   | additional_information   | 
      | English   | Fluent  | Spent 6 months in Dublin | 
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_languages" section 
    Then I am redirected to "Edit Language" page
      And I fill in "Language" with ""
      And I fill in "Level" with ""
      And I fill in "Additional information" with ""
    When I press "save"
    Then I should stay on "Edit Language" page
      And I should see "Error while saving the modifications." error message
      And I should see "Field cannot be empty." error message
          