Feature: Viewing projects

Background:	
	Given there are the following users:
			| email 				| password |
			| user@ovia.in 	| password |
		And I am signed in as them
		And there is a project called "TextMate 2"
		And "user@ovia.in" can view the "TextMate 2" project
	
		Scenario: Listing all projects
			And I am on the homepage
			When I follow "Projects"
			Then I should not see "Internet Explorer"
			When I follow "TextMate 2"
			Then I should be on the project page for "TextMate 2"