Feature: Creating comments
	In order to update a ticket's progress
	As a user
	I want to leave comments
	
	Background:
		Given there are the following users:
			| email 				| password |
			| user@ovia.in 	| password |
		And I am signed in as them
		And there is a project called "Ticketee"
		And "user@ovia.in" can view the "Ticketee" project
		And "user@ovia.in" has created a ticket for this project:
			| title 				  				| description                            |
			| Change a ticket's state | You should be able to create a comment |
		Given I am on the homepage
		And I follow "Projects"
		And I follow "Ticketee" within "#projects"
		Given there is a state called "Open"
		
	Scenario: Creating a comment
		Then show me the page
		When I follow "Change a ticket's state"
		And I fill in "Text" with "Added a comment!"
		And I press "Create Comment"
		Then I should see "Comment has been created."
		Then I should see "Added a comment!" within "#comments"
		
	Scenario: Changing a ticket's state
		Given "user@ovia.in" can change states on the "Ticketee" project
		When I follow "Change a ticket's state"
		When I fill in "Text" with "This is a real issue"
		And I select "Open" from "State"
		And I press "Create Comment"
		Then I should see "Comment has been created."		
		And I should see "Open" within "#ticket .state"
		Then I should see "Open" within "#comments"
	
		
	Scenario: Creating an invalid comment
		When I follow "Change a ticket's state"
		And I press "Create Comment"
		Then I should see "Comment has not been created."
		And I should see "Text can't be blank"
	
	Scenario: A user without permission cannot change the state
		When I follow "Change a ticket's state"
		Then I should not see the "#comment_state_id" element
	
	Scenario: Adding a tag to a ticket
		When I follow "Change a ticket's state"
		Then I should not see "bug" within "#ticket #tags"
		And I fill in "Text" with "Adding the bug tag"
		And I fill in "Tags" with "bug"
		And I press "Create Comment"
		Then I should see "Comment has been created"
		Then I should see "bug" within "#ticket #tags"
		