Feature: Editing a Product
	In order to change a product's details
	As an admin
	I want to be able to modify them through the backend

	Background:
		Given there are the following users:
			| email 			 	| password | admin |
			| admin@ovia.in	| password | true  |
		And I am signed in as them
		Given there is a category called "test_category"
		Given there are the following product:
			| name 						| description 										| code 	|	price | visible	| category_id |
			| sample product 	| some sample product description	| 1223	|	23.21	|	true		|    1				|
		Given I am on the homepage
		When I follow "Admin"
		And I follow "Products"
		And I follow "sample product"
		When I follow "Edit Product"

	Scenario: Updating a product's details
		When I fill in "Name" with "new product name"
		And I fill in "Description" with "new product description"
		And I press "Update Product"
		Then I should see "Product has been updated."
		And I should see "new product name"
		And I should not see "sample product"
		And I should not see "some sample product description"