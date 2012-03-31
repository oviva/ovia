Feature: Creating Product Options
In order to add new product options to the product
As an admin
I want to be able to add them through the backend

Background:
	Given there are the following users:
		| email 			 	| password | admin |
		| admin@ovia.in	| password | true  |
	And I am signed in as them
	
	Given I am on the homepage
	When I follow "Admin"
	And I follow "Product Options"
	When I follow "New Product Option"
	
	Scenario: Creating a new product option
		And I fill in "Name" with "size"		
		And I press "Create Product option"
		Then I should see "Product option has been created."
		
	Scenario: Leaving name blank results in an error
		When I fill in "Name" with ""
		And I press "Create Product option"
		Then I should see "Product option has not been created."
		And I should see "Name can't be blank"
	