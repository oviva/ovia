Feature: Creating Categories
In order to add new categories to the system
As an admin
I want to be able to add them through the backend

Background:
	Given there are the following users:
		| email 			 				| password | admin |
		| admin@ticketee.com	| password | true  |
	And I am signed in as them
	Given I am on the homepage
	When I follow "Admin"
	And I follow "Categories"
	When I follow "New Category"
	
	Scenario: Creating a new category
		And I fill in "Name" with "sample category"
		And I fill in "Description" with "some description for a category"
		And I press "Create Category"
		Then I should see "Category has been created."
		
	Scenario: Leaving name blank results in an error
			When I fill in "Name" with ""
			And I fill in "Description" with ""
			And I press "Create Category"
			Then I should see "Category has not been created."
			And I should see "Name can't be blank"
			And I should see "Description can't be blank"

	