Feature: A user must be able to Sign in

    Background:
    Given the following users are created in the database:
      | lastname | firstname | email                   | password      |
      | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      | Adams    | Bryan     | bryan.adams@gmail.com   | bryanpassword |

    Scenario: User sign in with valid data (scenario which works)
      Given I go to the sign in page
        And I fill in "user_email" with "fabrice.cheng@gmail.com"
        And I fill in "user_password" with "fabpassword"
      When I press "sign_in"
      Then I am redirected to home page
        And I should be signed in
        And I should see "fabrice.cheng@gmail.com" on the home page


    Scenario: User sign in with unexisting email (scenario doesn't works)
      Given I go to the sign in page
        And I fill in "user_email" with "unknown@gmail.com"
        And I fill in "user_password" with "fabpassword"
      When I press "sign_in"
      Then I should stay on the sign in page
        And I should not be signed in
        And I should see "Invalid email or password." error message


    Scenario: User sign in with an incorrect password (scenario doesn't works)
      Given I go to the sign in page
        And I fill in "user_email" with "fabrice.cheng@gmail.com"
        And I fill in "user_password" with "bryanpassword"
      When I press "sign_in"
      Then I should stay on the sign in page
        And I should not be signed in
        And I should see "Invalid email or password." error message    