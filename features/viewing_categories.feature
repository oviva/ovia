Feature: Viewing categories
	In order to view the all the categories
	As a admin
	I want to see them in admin panel

	Background:	
		Given there are the following users:
				| email 				| password |
				| user@ovia.in 	| password |
			And I am signed in as them
			And there is a category called "Sample Category"
			
	Scenario: Listing all categories
		And I am on the homepage
		Then I should see "Sample Category"
		When I follow "Sample Category"
		And I should see "Ovia | Sample Category"