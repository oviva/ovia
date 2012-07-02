Feature: Creating Pages
	In order to add new pages to the system
	As an admin
	I want to be able to add them through the backend

	Background:
		Given there are the following users:
			| email 			 	| password | admin |
			| admin@ovia.in	| password | true  |
		And I am signed in as them
		Given I am on the homepage
		When I follow "Admin"
		And I follow "Pages"
		When I follow "New Page"
	
	Scenario: Creating a new page
		And I fill in "Name" with "sample page"
		And I fill in "Content" with "some content for a page"
		And I press "Create Page"
		Then I should see "Page has been created."
		
	Scenario: Leaving name blank results in an error
			When I fill in "Name" with ""
			And I fill in "Content" with ""
			And I press "Create Page"
			Then I should see "Page has not been created."
			And I should see "Name can't be blank"
			And I should see "Content can't be blank"
