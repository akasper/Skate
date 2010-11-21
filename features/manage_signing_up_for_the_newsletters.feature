Feature: Manage signing_up_for_the_newsletters
  In order to be informed of new news for Bothitong Skate Company 
  A visitor to our site
  wants to give us his email address and receive the newsletter whenever it is new.
  
  Scenario: Seeing the field to enter my email
		When I visit the homepage
		Then I should see ".email form"
		
	Scenario: Entering an email address
		When I visit the homepage
		And I enter my email address into "email"
		And I press "Submit"
		Then I should see "Thanks for your email address"
		And I should receive and email that says "You are now signed up for the Skate newsletter"
#		Given -- just sets up background for the scenario
#		When -- simulating a user taking action
#		Then -- verify that something is true