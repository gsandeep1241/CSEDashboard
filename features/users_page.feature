Feature: I want to be able to see all users on the platform so I can stalk them
  
  
  Background: 
    Given the app is set up
    And I am logged in
    
    
    Scenario: See Users
      When I follow "Users"
      Then I should see "All users"