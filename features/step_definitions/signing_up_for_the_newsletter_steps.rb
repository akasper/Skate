When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see the "([^"]*)" form$/ do |form_name|
  form_name.should == 'email'
  selector = 'form#new_user'
  page.should have_selector selector
  
  # with_scope selector do |scope|
  #   scope.should have_selector 'label[value="email"]'
  #   scope.should have_selector 'input[type="text"][name="user[email]"]'
  #   scope.should have_selector 'input[type="submit"][value="Sign Up"]'
  # end
end

Then /^"([^"]*)" should receive an email from "([^"]*)" that says "([^"]*)"$/ do |recipient, sender, content|
  @email = ActionMailer::Base.deliveries.last
  @email.to.should be_include recipient
  @email.from.should be_include sender
  @email.encoded.should =~ Regexp.new(content)
  # @email.html_part.should =~ Regexp.new(content)
end

Then /^"([^"]*)" should receive an email from "([^"]*)" that does not say "([^"]*)"$/ do |recipient, sender, content|
  @email = ActionMailer::Base.deliveries.last
  @email.to.should be_include recipient
  @email.from.should be_include sender
  @email.encoded.should_not =~ Regexp.new(content)
end

Then /^I should be opted out$/ do
  @user ||= User.first
  @user.opt_out.should == true
end
