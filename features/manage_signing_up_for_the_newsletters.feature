Feature: Manage signing_up_for_the_newsletters
	In order to be informed of news regarding Bothitong Skate Company 
	A visitor to our site
	wants to give us his email address and receive the newsletter whenever it is new.

	Background:
		When I visit the homepage
		
  Scenario: Seeing the newsletter signup form
		Then I should see the "email" form
		
	Scenario: Entering an email address
		When I fill in "user_email" with "foo@bar.com"
		And I press "Sign Up"
		Then I should be on the "show user" page
		Then I should see "You have been signed up for the Skate newsletter"
		And "foo@bar.com" should receive an email from "skate" that says "You are now signed up for the Skate newsletter"
		And "foo@bar.com" should receive an email from "skate" that does not say "You have opted out of the begging emails"

	Scenario: Entering an existing email address
		Given a user with "email" "foo@bar.com"
		When I fill in "user_email" with "foo@bar.com"
		And I press "Sign Up"
		Then I should be on the "new user" page
		And I should see "already taken" within "#errors"

	Scenario: Entering no email address
		When I press "Sign Up"
		Then I should be on the "new user" page
		And I should see "must not be blank" within "#errors"

	Scenario: Entering an invalid email address
		When I fill in "user_email" with "asdf"
		And I press "Sign Up"
		Then I should be on the "new user" page
		And I should see "invalid format" within "#errors"
		
	Scenario: Opting out of begging for money email
		When I fill in "user_email" with "foo@bar.com"
		And I check "user_opt_out"
		And I press "Sign Up"
		Then I should be opted out
		Then I should be on the "show user" page
		And "foo@bar.com" should receive an email from "skate" that says "You have opted out of the begging emails"
