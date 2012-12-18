Feature: A user registered or not can contact ReachJobs founder

    Scenario: Anonymous user contacts ReachJobs founder with valid data (scenario which works)
      Given I go to the Contact Us page
      Then I should see "Email" empty
        And I should see "Name" empty
        And I fill in "Name" with "Fabrice Cheng"
        And I fill in "Email" with "fabrice.cheng@gmail.com"
        And I fill in "Message" with "Feedback test"
      When I press "send_message"
      Then I should stay on Contact Us page
        And I should see "Message sent to ReachJobs administrator. You'll received a response soon." notice message


    Scenario: Signed in user contacts ReachJobs founder with valid data (scenario which works)
      Given I go to the Contact Us page
      Then I should see "Email" with "fabrice.cheng@gmail.com"  
        And I should see "Name" with "Fabrice Cheng"
        And I fill in "Message" with "Feedback test"
      When I press "send_message"
      Then I should stay on Contact Us page
        And I should see "Message sent to ReachJobs administrator. You'll received a response soon." notice message


    Scenario: Anonymous user fails to contact ReachJobs founder because of missing data
      Given I go to the Contact Us page
      When I press "send_message"
      Then I should stay on Contact Us page
        And I should see "Field cannot be empty." error message
        And I should see "Error while sending a message." error message