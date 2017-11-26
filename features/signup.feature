Feature: User Signup
  As a user, I want to be able to Signup to the application
  
  Background:
    Given the app is set up
    
    Scenario: Correct Login
      When I am on the signup page
      And I fill in "user_name" with "Dummy"
      And I fill in "user_email" with "Dummy@dummyyyy.com"
      And I fill in "user_password" with "dummyyyy"
      And I fill in "user_password_confirmation" with "dummyyyy"
      And I press "Create my account"
      Then I should see "Please check your email to activate your account."
      
    Scenario: Wrong Signup
    When I am on the signup page
      And I fill in "user_name" with "Dummy"
      And I fill in "user_email" with "Dummy@dummyyyy.com"
      And I fill in "user_password" with "dummyyyy"
      And I fill in "user_password_confirmation" with "dummyyyyyyy"
      And I press "Create my account"
      Then I should see "The form contains 1 error."