Feature: User Login
  As a user of the application
  In order to be able to use the application
  I want to be able to login
  
  Background:
    Given the app is set up
    
    Scenario: Correct Login
      When I am on the login page
      And I fill in "session_email" with "admin@admin.com"
      And I fill in "session_password" with "foobar"
      And I press "Log in"
      Then I should see "admin"
      
    Scenario: Wrong Login
      When I am on the login page
      And I fill in "session_email" with "adm@adm.com"
      And I fill in "session_password" with "foorab"
      And I press "Log in"
      Then I should see "Invalid email/password combination"
    