Feature: Creating Products
In order to add new products
As an admin
I want to be able to add them through the backend

Background:
	Given there are the following users:
		| email 			 	| password | admin |
		| admin@ovia.in	| password | true  |
	And I am signed in as them
	Given there is a category called "Category1"
		
	Given I am on the homepage
	When I follow "Admin"
	And I follow "Products"
	When I follow "New Product"
	
	Scenario: Creating a new product
		And I fill in "Name" with "sample product"
		And I fill in "Description" with "some description for a product"
		And I fill in "Code" with "35256"
		And I fill in "Price" with "35.90"
		And I press "Create Product"
		Then I should see "Product has been created."
		
	Scenario: Leaving name blank results in an error
			When I fill in "Name" with ""
			And I fill in "Description" with ""
			And I fill in "Code" with ""
			And I fill in "Price" with ""
			And I press "Create Product"
			Then I should see "Product has not been created."
			And I should see "Name can't be blank"
			And I should see "Description can't be blank"
			And I should see "Code can't be blank"
			And I should see "Price can't be blank"
			
	@javascript		
	Scenario: Creating a product with an attachment
			And I fill in "Name" with "sample product"
			And I fill in "Description" with "some description for a product"
			And I fill in "Code" with "35256"
			And I fill in "Price" with "35.90"
			And I attach the file "spec/fixtures/image1.jpg" to "File #1"
			And I follow "Add another image"
			And I attach the file "spec/fixtures/image2.jpg" to "File #2"
			And I press "Create Product"
			Then I should see "Product has been created."
			
