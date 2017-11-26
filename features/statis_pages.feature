Feature: Static Pages
  As a user of the application
  In order to be able to use the application
  I want to see all the static pages
  
  Scenario: Static_pages

    Given I am on the home page
    When I follow "About"
    Then I should see "about"
    
    Given I am on the home page
    And I follow "Contact"
    Then I should see "contact"
    
    Given I am on the help page
    And I follow "Help"
    Then I should see "help"