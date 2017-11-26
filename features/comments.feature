Feature: As a user, I want to be able to see and make comments
  
  Background:
    Given the app is set up
    And I am logged in
    And I follow "Home"
    And I fill in "micropost_content" with "New post!"
    And I press "Post"
    
    Scenario: See comments
      When I follow "See my Profile"
      Then I should see "0 Comments"
      
    Scenario: Make comments
      When I follow "See my Profile"
      And I follow "0 Comments"
      And I fill in "comment-text-area" with "New comment"
      And I press "Comment"
      Then I should see "Comment successful!"
      