Feature: Viewing tickets
In order to view the tickets for a project
As a user
I want to see them on that project's page

Background:
	Given there are the following users:
		| email 			| password |
		| user@ovia.in | password |
	And I am signed in as them
  	Given there is a project called "TextMate 2"
	And "user@ovia.in" can view the "TextMate 2" project
  	And "user@ovia.in" has created a ticket for this project:
    	| title           | description                   |
    	|  Make it shiny! | Gradients! Starbursts! Oh my! |

  And there is a project called "Internet Explorer"
  And "user@ovia.in" can view the "Internet Explorer" project
  And "user@ovia.in" has created a ticket for this project:
    	| title                | description   |
    	| Standards compliance | Isn't a joke. |

  And I am on the homepage
	And I follow "Projects"


  Scenario: Viewing tickets for a given project
    When I follow "TextMate 2"
    Then I should see "Make it shiny!"
    And I should not see "Standards compliance"
    When I follow "Make it shiny!"
    Then I should see "Make it shiny" within "#ticket h2"
    And I should see "Gradients! Starbursts! Oh my!"
  
    And I am on the homepage
		And I follow "Projects"
    When I follow "Internet Explorer"
    Then I should see "Standards compliance"
    And I should not see "Make it shiny!"
    When I follow "Standards compliance"
    Then I should see "Standards compliance" within "#ticket h2"
    And I should see "Isn't a joke."