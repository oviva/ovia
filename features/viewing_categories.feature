Feature: Viewing categories

Background:	
Given there are the following users:
		| email 				| password |
		| user@ovia.in | password |
	And I am signed in as them
	And there is a category called "Sample Category"
	
		
Scenario: Listing all categories
	And I am on the homepage
	Then I should see "Sample Category"
	When I follow "Sample Category"
	#Then I should be on the category page for "TextMate 2"