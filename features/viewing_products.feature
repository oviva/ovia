Feature: Viewing products

Background:	
Given there are the following users:
		| email 				| password |
		| user@ovia.in 	| password |
	And I am signed in as them
	And there is a category called "Sample Category"
	And there is a product called "Sample Product"
	
		
Scenario: Listing all categories
	And I am on the homepage
	Then I should see "Sample Category"
	When I follow "Sample Category"
	And I should see "Ovia | Sample Category "