Feature: An authenticated user must be able add/edit recommendations he got

    Background:
      Given the following users are created in the database:
        | lastname | firstname | email                   | password      |
        | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"  
      Given I go to my profile page   
	     
    Scenario Outline: User adds a new recommendation (scenario which works)
      Given I press on "add_recommendation" link
	    Then I am redirected to "Add New Recommendation" page	    
    		And I fill in "recommendation_author" with "<author>"
    		And I fill in "recommendation_relation" with "<relation>"
    		And I fill in "recommendation_content" with "<content>"
	    When I press "save"
	    Then I am redirected to my profile page
    		And I should see "<author>" within "profile_aboutme_recommendations" section
    		And I should see "<relation>" within "profile_aboutme_recommendations" section
    		And I should see "<content>" within "profile_aboutme_recommendations" section
  	Examples:
      |author        | relation |content                        |
      |Cicero Torano | manager  |Sed ut perspiciatis unde omnis |

	
  	Scenario Outline: User edits a recommendation (scenario which works)
      Given the following recommendations are created in the database:
        | author            | relation    | content                  | 
        | Basile Cirdero    | co-worker   | Existing Recommendation  |
      Given I go to my profile page  
      Given I press "Edit" within "list_recommendations" section 
  	  Then I am redirected to "Edit Recommendation" page	    
    		And the "recommendation_author" field should contain "Basile Cirdero"
    		And the "recommendation_relation" field should contain "co-worker"
    		And the "recommendation_content" field should contain "Existing Recommendation"
    		And I fill in "recommendation_author" with "<author>"
    		And I fill in "recommendation_relation" with "<relation>"
    		And I fill in "recommendation_content" with "<content>"
  	  When I press "save"
  	  Then I am redirected to my profile page
    		And I should see "<author>" within "profile_aboutme_recommendations" section
    		And I should see "<relation>" within "profile_aboutme_recommendations" section
    		And I should see "<content>" within "profile_aboutme_recommendations" section
  	Examples:
      |author        | relation |content            							             |
      |Arya Detables | CEO      |vero eos et accusamus et iusto odio dignissi  |


  	@javascript
  	Scenario: User deletes a recommendation (scenario which works)
      Given the following recommendations are created in the database:
        | author            | relation    | content                  | 
        | Basile Cirdero    | co-worker   | Existing Recommendation  |
      Given I go to my profile page  
      Given I press "Delete" within "list_recommendations" section 
  	  Then I should stay on my profile page	    
    		And I should not see "Basile Cirdero" within "profile_aboutme_recommendations" section
    		And I should not see "co-worker" within "profile_aboutme_recommendations" section
    		And I should not see "Existing Recommendation" within "profile_aboutme_recommendations" section


  	Scenario: User adds a new recommendation without filling in an author (error)
      Given I press on "add_recommendation" link
  	  Then I am redirected to "Add New Recommendation" page	    
    		And I fill in "recommendation_relation" with "Project Manager"
    		And I fill in "recommendation_content" with "vero eos et accusamus et iusto odio dignissi"
  	  When I press "save"
  	  Then I should stay on "Add New Recommendation" page	
        And I should see "Error while creating the recommendation." error message
  		  And I should see "Field cannot be empty." error message


    Scenario: User edits a recommendation without filling in an author (error)
      Given the following recommendations are created in the database:
        | author            | relation    | content                  | 
        | Basile Cirdero    | co-worker   | Existing Recommendation  |
      Given I go to my profile page  
      Given I press "Edit" within "list_recommendations" section 
      Then I am redirected to "Edit Recommendation" page      
        And I fill in "recommendation_relation" with "Project Manager"
        And I fill in "recommendation_content" with "vero eos et accusamus et iusto odio dignissi"
        And I fill in "recommendation_author" with ""
      When I press "save"
      Then I should stay on "Edit Recommendation" page 
        And I should see "Error while saving the modifications." error message
        And I should see "Field cannot be empty." error message    
	