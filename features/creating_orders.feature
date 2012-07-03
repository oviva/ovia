Feature: Creating Orders
  In order to add new orders to the system
  As an admin
  I want to be able to add them through the backend

  Background:
    Given there are the following users:
      | email         | password | admin |
      | admin@ovia.in | password | true  |
    And I am signed in as them
    Given I am on the homepage
    When I follow "Admin"
    And I follow "Orders"
    When I follow "New Order"
  
  Scenario: Creating a new order
    And I fill in "Order no" with "3244"
    And I fill in "Total amount" with "32"
    And I press "Create Order"
    Then I should see "Order has been created."
    
  Scenario: Leaving name blank results in an error
      When I fill in "Order no" with ""
      And I fill in "Total amount" with ""
      And I press "Create Order"
      Then I should see "Order has not been created."
      And I should see "Order no can't be blank"
      And I should see "Total amount can't be blank"

