Feature: A user must be able to register

    Scenario: User registers with valid data (scenario which works)
      Given I go to the register page
        And I fill in "Lastname" with "Cheng"
        And I fill in "Firstname" with "Fabrice"
        And I fill in "Email" with "fabrice.cheng@gmail.com"
        And I fill in "Password" with "UCLApassword"
        And I fill in "Pw Confirmation" with "UCLApassword"
      When I press "register"
      Then I am redirected to home page
        And I should be signed in
        And I should see "fabrice.cheng@gmail.com" on the home page

    
    Scenario: User fails to register because of missing data (scenario that doesn't work)
      Given I go to the register page
      When I press "register"
      Then I should stay on register page
        And I should see "Field cannot be empty." error message
    

    Scenario: User fails to register because of incorrect email format (scenario that doesn't work)
      Given I go to the register page
        And I fill in "Lastname" with "Cheng"
        And I fill in "Firstname" with "Fabrice"
        And I fill in "Email" with "fabricegmail.com"
        And I fill in "Password" with "UCLApassword"
        And I fill in "Pw Confirmation" with "UCLApassword"
      When I press "register"
      Then I should stay on register page
        And I should not be signed in
    

    Scenario: User fails to register because email already exists (scenario that doesn't work)
      Given a user with email "fabrice@gmail.com" already exists
      When I go to the register page
        And I fill in "Lastname" with "Cheng"
        And I fill in "Firstname" with "Fabrice"
        And I fill in "Email" with "fabrice@gmail.com"
        And I fill in "Password" with "UCLApassword"
        And I fill in "Pw Confirmation" with "UCLApassword"
      When I press "register"
      Then I should stay on register page
        And I should not be signed in
        And I should see "has already been taken" error message


    Scenario: User fails to register because password_confirmation doesn't match password (scenario that doesn't work)
      Given a user with email "fabrice@gmail.com" already exists
      When I go to the register page
        And I fill in "Lastname" with "Cheng"
        And I fill in "Firstname" with "Fabrice"
        And I fill in "Email" with "fabrice@gmail.com"
        And I fill in "Password" with "UCLApassword"
        And I fill in "Pw Confirmation" with "DifferentPassword"
      When I press "register"
      Then I should stay on register page
        And I should not be signed in
        And I should see "doesn't match confirmation" error message   



