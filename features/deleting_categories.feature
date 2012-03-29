Feature: Deleting Categories
	In order to remove needless categories
	As a admin
	I want to make them disappear
	
	Background:
		Given there are the following users:
  		| email               | password |	admin |	
  		| admin@ovia.in  | password |	true  |
  	And I am signed in as them
		
		Scenario: Deleting a category
			Given there are the following category:
						| name 							| description 												|
						| sample category 	| some sample category description		|
			Given I am on the homepage
			When I follow "Admin"
			And I follow "Categories"
			And I follow "sample category"
			And I follow "Delete Category"
			Then I should see "Category has been deleted."
			Then I should not see "sample category"