Feature: Assigning permissions
  In order to set up users with the correct permissions
  As an admin
  I want to check all the boxes
  
  Background:
    Given there are the following users:
      | email           | password | admin |
      | admin@ovia.in   | password | true  |
    And I am signed in as them
    And there are the following users:
      | email         | password |
      | user@ovia.in  | password |
    And there is a project called "TextMate 2"
    And "user@ovia.in" has created a ticket for this project:
      | title  | description       |
      | Shiny! | Eye-blindingly so |
    When I follow "Admin"
    And I follow "Users"
    And I follow "user@ovia.in"
    And I follow "Permissions"
    Given there is a state called "Open"
  
  Scenario: Viewing a project
    When I check "View" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out" 
    Given I am signed in as "user@ovia.in"
    And I follow "Projects" 
    Then I should see "TextMate 2"
  
  Scenario: Creating tickets for a project
    When I check "View" for "TextMate 2"
    When I check "Create tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
  
    Given I am signed in as "user@ovia.in"
    And I follow "Projects"   
    When I follow "TextMate 2"
    And I follow "New Ticket"
    And I fill in "Title" with "Shiny!"
    And I fill in "Description" with "Make it so!"
    And I press "Create"
    Then I should see "Ticket has been created."
  
  Scenario: Updating a ticket for a project
    When I check "View" for "TextMate 2"
    And I check "Edit tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
  
    Given I am signed in as "user@ovia.in"
    And I follow "Projects" 
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I follow "Edit"
    And I fill in "Title" with "Really shiny!"
    And I press "Update Ticket"
    Then I should see "Ticket has been updated"
  
  Scenario: Deleting a ticket for a project
    When I check "View" for "TextMate 2"
    And I check "Delete tickets" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
  
    Given I am signed in as "user@ovia.in"
    And I follow "Projects" 
    When I follow "TextMate 2"
    And I follow "Shiny!"
    And I follow "Delete"
    Then I should see "Ticket has been deleted."
  
  Scenario: Changing states for a ticket
    When I check "View" for "TextMate 2"
    And I check "Change States" for "TextMate 2"
    And I press "Update"
    And I follow "Sign out"
    Given I am signed in as "user@ovia.in"
    And I follow "Projects"
    When I follow "TextMate 2"
    And I follow "Shiny!"
    When I fill in "Text" with "Opening this ticket."
    And I select "Open" from "State"
    And I press "Create Comment"
    Then I should see "Comment has been created."
    And I should see "Open" within "#ticket .state"