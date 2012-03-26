Feature: Creating Products
In order to add new categories to the system
As an admin
I want to be able to add them through the backend

Background:
	Given there are the following users:
		| email 			 				| password | admin |
		| admin@ticketee.com	| password | true  |
	And I am signed in as them
	
	Given there is a product called "demo_product"
	
		
	Given I am on the homepage
	When I follow "Admin"
	And I follow "Products"
	When I follow "demo_product"
	When I follow "Edit Product"
	
	Scenario: Updating a Product's details
		When I fill in "Name" with "new product name"
		And I fill in "Description" with "new product description"
		And I fill in "Code" with "3210"
		And I fill in "Price" with "15.60"
		And I press "Update Product"
		Then I should see "Product has been updated."
		And I should see "new product name"