Feature: As an admin, I should be able to see pending posts
  
  Background:
    Given the app is set up
    Given the post is set up
    And I am logged in
    
    Scenario: Admin able to see tags
      When I follow "Home"
      Then I should see "New content"
      And I follow "Tags"
      Then I should see "New content"