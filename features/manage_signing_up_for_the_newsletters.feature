Feature: Manage signing_up_for_the_newsletters
	In order to be informed of news regarding Bothitong Skate Company 
	A visitor to our site
	wants to give us his email address and receive the newsletter whenever it is new.

  Scenario: Seeing the newsletter signup form
		When I visit the homepage
		Then I should see the "email" form
		
	Scenario: Entering an email address
		When I visit the homepage
		And I fill in "user_email" with "foo@bar.com"
		And I press "Sign Up"
		Then I should be on the "show user" page
		Then I should see "You have been signed up for the Skate newsletter"
		And "foo@bar.com" should receive an email from "skate" that says "You are now signed up for the Skate newsletter"
