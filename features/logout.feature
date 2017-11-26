Feature: As a user I should be able to logout of the application
  
  Background:
    Given the app is set up
    And I am logged in
    
    Scenario: Logout
      
      When I follow "Account"
      And I follow "Log out"
      
      Then I should see "Welcome to CSE Dashboard"