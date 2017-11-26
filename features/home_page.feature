Feature: I want to see my home page when I log in
  I want to see the web site home page when I am not logged in
  
  
  Background:
    Given the app is set up
    
    Scenario: I am logged in
      When I am on the login page
      And I fill in "session_email" with "admin@admin.com"
      And I fill in "session_password" with "foobar"
      And I press "Log in"
      Then I should see "admin"
      
      
    Scenario: When I am not logged in
      I should see "Welcome to CSE Dashboard"