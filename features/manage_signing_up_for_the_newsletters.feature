Feature: Manage signing_up_for_the_newsletters
  In order to be informed of new news for Bothitong Skate Company 
  A visitor to our site
  wants to give us his email address and receive the newsletter whenever it is new.
  
  Scenario: Seeing the newsletter signup form
		When I visit the homepage
		Then I should see the "email" form
		
	Scenario: Entering an email address
		When I visit the homepage
		And I enter my email address into "email"
		And I press "Sign Up"
		Then I should see "You have been signed up for the Skate newsletter"
		And I should receive and email that says "You are now signed up for the Skate newsletter"
