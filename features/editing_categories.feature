Feature: Editing a Category
In order to change a category's details
As an admin
I want to be able to modify them through the backend

Background:
	Given there are the following users:
		| email 			 				| password | admin |
		| admin@ovia.in	| password | true  |
	And I am signed in as them
	
	Given there are the following category:
		| name 							| description 												|
		| sample category 	| some sample category description		|

	Given I am on the homepage
	When I follow "Admin"
	And I follow "Categories"
	And I follow "sample category"
	When I follow "Edit Category"

Scenario: Updating a category's details
	When I fill in "Name" with "new category name"
	And I fill in "Description" with "new category description"
	And I press "Update Category"
	Then I should see "Category has been updated."
	And I should see "new category name"
	And I should not see "sample category"
	And I should not see "some sample category description"