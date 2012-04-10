Feature: Creating Sizes
In order to add new sizes to the system
As an admin
I want to be able to add them through the backend

Background:
	Given there are the following users:
		| email 			 	| password | admin |
		| admin@ovia.in	| password | true  |
	And I am signed in as them
	Given I am on the homepage
	When I follow "Admin"
	And I follow "Sizes"
	When I follow "New Size Option"
	
	Scenario: Creating a new size
		And I fill in "Name" with "sample size"
		And I press "Create Size"
		Then I should see "Size has been created."
		
	Scenario: Leaving name blank results in an error
		When I fill in "Name" with ""
		And I press "Create Size"
		Then I should see "Size has not been created."
		And I should see "Name can't be blank"
			

