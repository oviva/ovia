Feature: Deleting users
In order to remove users
As an admin
I want to click a button and delete them

Background:
	Given there are the following users:
		| email 			 | password | admin |
		| admin@ovia.in | password | true  |
		| user@ovia.in  | password | false |
	And I am signed in as "admin@ovia.in"
	Given I am on the homepage
	When I follow "Admin"
	And I follow "Users"
	Scenario: Deleting a user
	And I follow "user@ovia.in"
	When I follow "Delete User"
	Then I should see "User has been deleted"

	Scenario: Userscannot delete themselves
		When I follow "admin@ovia.in"
		And I follow "Delete User"
		Then I should see "You cannot delete yourself!"