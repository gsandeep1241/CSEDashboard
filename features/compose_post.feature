Feature: As a user, I want to be able to create a post
  
 Background:
   Given the app is set up
   And I am logged in
   
   Scenario: Compose a post
     When I follow "Home"
     And I fill in "micropost_content" with "This is a new post"
     And I press "Post"
     Then I should see "Post created!"
     
     When I follow "See my Profile"
     Then I should see "This is a new post"
     
    Scenario: Anonymous Post
      When I follow "Home"
      And I fill in "micropost_content" with "This is a new post"
      When I check "micropost_anony"
      And I press "Post"
      Then I should see "Post created anonymously."
      
