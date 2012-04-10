Feature: Editing a Page
In order to change a page's details
As an admin
I want to be able to modify them through the backend

Background:
	Given there are the following users:
		| email 			 	| password | admin |
		| admin@ovia.in	| password | true  |
	And I am signed in as them
	
	Given there are the following page:
		| name 					| content 										|
		| sample page 	| some sample page content		|

	Given I am on the homepage
	When I follow "Admin"
	And I follow "Pages"
	And I follow "sample page"
	When I follow "Edit Page"

Scenario: Updating a page's details
	When I fill in "Name" with "new page name"
	And I fill in "Content" with "new page content"
	And I press "Update Page"
	Then I should see "Page has been updated."
	And I should see "new page name"
	And I should not see "sample page"
	And I should not see "some sample page content"