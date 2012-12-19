Feature: A user registered or not can contact ReachJobs founder

    Background:
    Given the following users are created in the database:
      | lastname | firstname | email                   | password      |
      | Cheng    | Fabrice   | fabrice.cheng@gmail.com | fabpassword   |
      | Adams    | Bryan     | bryan.adams@gmail.com   | bryanpassword |
    
    @email
    Scenario: Anonymous user contacts ReachJobs founder with valid data (scenario which works)
      Given I go to the Contact Us page
      Then I should see "Email" empty
        And I should see "Name" empty
        And I fill in "Name" with "Bryan Adams"
        And I fill in "Email" with "bryan.adams@gmail.com"
        And I fill in "Message" with "Feedback test"
      When I press "send_message"
      Then I should stay on Contact Us page
        And I should see "Message sent to ReachJobs administrator. You'll received a response soon." notice message
        And an email should have been sent from "bryan.adams@gmail.com"

    @email
    Scenario: authenticated user contacts ReachJobs founder with valid data (scenario which works)
      Given I am logged in as "fabrice.cheng@gmail.com" with password "fabpassword"
      Given I go to the Contact Us page
      Then the "Email" field should contain "fabrice.cheng@gmail.com"  
        And the "Name" field should contain "Fabrice Cheng"
        And I fill in "Message" with "Feedback test"
      When I press "send_message"
      Then I should stay on Contact Us page
        And I should see "Message sent to ReachJobs administrator. You'll received a response soon." notice message
        And an email should have been sent from "fabrice.cheng@gmail.com"

    @email    
    Scenario: Anonymous user fails to contact ReachJobs founder because of missing data
      Given I go to the Contact Us page
      When I press "send_message"
      Then I should stay on Contact Us page
        And I should see "Field cannot be empty." error message
        And I should see "Error while sending a message." error message
        And an email should not have been sent