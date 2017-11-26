Feature: As a user I want to be able to search for micropost 
  
  Background:
    Given the app is set up
    And I am logged in 
    
    Scenario: Search for a post
      
      When I follow "Home"
      When I fill in "micropost_content" with "Searchable post"
      And I press "Post"
      
      And I fill in "search" with "Searchable"
      And I press "Search"
      
      Then I should see "Searchable post"