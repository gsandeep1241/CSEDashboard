Feature: User Login
  As a user of the application
  In order to be able to use the application
  I want to be able to login
  
  Scenario: Login
    
    Given I am on the login page
    When I fill in "session_email" with "abc@d.com"
    And I fill in "session_password" with "abcabc"
    And I press "Log in"
    
    Then I should see "Invalid email/password combination"
    