Feature: An authenticated user must be able add/edit skills by skill category

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page
      Given I press on "resume" tab      

    @javascript
    Scenario: User adds a new skill category with one skill (scenario which works)
      Given I press on "+ Add New Skill" link
      Then I am redirected to "Add Skills" page     
        And I fill in "skillcategory_category_name" with "Web Technology"
        And I fill in "new_skill" with "Ruby on Rails"
      Then I press on "Button_add" image
        And I wait for the ajax request to finish
        And I should see "Ruby on Rails" within the "list_of_skills_container" field
      Then I press on "Ico_delete_skill" image
        And I wait for the ajax request to finish
        And I should not see "Ruby on Rails" within the "list_of_skills_container" field
        And I fill in "new_skill" with "HTML"
      Then I press on "Button_add" image
        And I wait for the ajax request to finish
        And I should see "HTML" within the "list_of_skills_container" field
      When I press "save"
      Then I am redirected to my profile page
        And I should see "WEB TECHNOLOGY" on my profile page
        And I should see "HTML" on my profile page

    @javascript    
    Scenario: User edits a skill category by adding one new skill and changing skill category's name (scenario which works)
    Given the following skillcategory are created in the database:
      | category_name      | skill_name    |
      | Web Technology     | Ruby on Rails |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_skillcategories" section 
    Then I am redirected to "Edit Skills" page      
      And the "skillcategory_category_name" field should contain "Web Technology"
      And I should see "Ruby on Rails" within the "list_of_skills_container" field
      And I fill in "skillcategory_category_name" with "Test Technology"
      And I fill in "new_skill" with "HTML"
      Then I press on "Button_add" image
        And I wait for the ajax request to finish    
    When I press "save"
    Then I am redirected to my profile page
      And I should see "TEST TECHNOLOGY" on my profile page
        And I should see "HTML" on my profile page
        And I should see "Ruby on Rail" on my profile page


    @javascript
    Scenario: User deletes a skill category (scenario which works)
      Given the following skillcategory are created in the database:
      | category_name      | skill_name    |
      | Web Technology     | Ruby on Rails |
      Given I go to my profile page
      Given I press on "resume" tab  
      Given I press "Delete" within "profile_resume_skillcategories" section 
      Then I should stay on my profile page     
        And I should not see "WEB TECHNOLOGY" on my profile page
        And I should not see "Ruby on Rail" on my profile page


    Scenario: User adds a new skill category with empty skill category name (error)
      Given I press on "+ Add New Skill" link
      Then I am redirected to "Add Skills" page     
      When I press "save"
      Then I should stay on "Add Skills" page
        And I should see "An error has occured." error message
        And I should see "Field cannot be empty." error message

    Scenario: User edits a skill category by with an empty skill category name (error)
    Given the following skillcategory are created in the database:
      | category_name      | skill_name    |
      | Web Technology     | Ruby on Rails |
    Given I go to my profile page
    Given I press on "resume" tab  
    Given I press "Edit" within "profile_resume_skillcategories" section 
    Then I am redirected to "Edit Skills" page      
      And I fill in "skillcategory_category_name" with ""
    When I press "save"
    Then I should stay on "Edit Skills" page
      And I should see "Error while saving the modifications." error message
      And I should see "Field cannot be empty." error message