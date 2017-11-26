Feature: I should be able to see my profile page
  
  Background: 
    Given the app is set up
    And I am logged in
    And I follow "Home"
    
    Scenario:
      When I follow "See my Profile"
      Then I should see "admin"
      And I should not see "See my Profile"
      