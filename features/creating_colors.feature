Feature: Creating Colors
In order to add new colors to the system
As an admin
I want to be able to add them through the backend

	Background:
		Given there are the following users:
			| email 	    | password | admin |
			| admin@ovia.in	| password | true  |
		And I am signed in as them
		Given I am on the homepage
		When I follow "Admin"
		And I follow "Colors"
		When I follow "New Color Option"
	
	Scenario: Creating a new color
		And I fill in "Name" with "sample color"
		And I press "Create Color"
		Then I should see "Color has been created."
	
	Scenario: Leaving name blank results in an error
		When I fill in "Name" with ""
		And I press "Create Color"
		Then I should see "Color has not been created."
		And I should see "Name can't be blank"
		

