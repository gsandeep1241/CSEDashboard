Feature: I want to be able to edit my profile details
  
  Background:
    Given the app is set up
    And I am logged in
    
    
    Scenario: Change settings
      When I follow "Account"
      And I follow "Settings"
      Then I should see "Update your profile"