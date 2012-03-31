Feature: Creating Product Option Variations
	In order to add new product option vairations to the product option
	As an admin
	I want to be able to add them through the backend

Background:
	Given there are the following users:
		| email 			 	| password | admin |
		| admin@ovia.in	| password | true  |
	And I am signed in as them
	Given there is a product option called "size"
	
	Given I am on the homepage
	When I follow "Admin"
	And I follow "Product Options"
	And I follow "size"
	When I follow "New Product Option Variation"
	
	Scenario: Creating a new product option
		And I fill in "Name" with "Small"		
		And I press "Create Product option variation"
		Then I should see "Product option variation has been created."
		
	Scenario: Leaving name blank results in an error
		When I fill in "Name" with ""
		And I press "Create Product option variation"
		Then I should see "Product option variation has not been created."
		And I should see "Name can't be blank"
