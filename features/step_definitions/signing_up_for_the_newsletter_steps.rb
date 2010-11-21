When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see the "([^"]*)" form$/ do |form_name|
  form_name.should == 'email'
  Then 'I should see /Email/ within "form"'
  Then 'I should see a "Sign Up" button within "form"'
end

Then /^I should see a "([^"]*)" button within "([^"]*)"$/ do |name, selector|
  whole_selector = selector + " input[type='submit'][value='#{name}']"
  page.should have_selector(whole_selector)
end

When /^I enter my email address into the signup form$/ do
  
  pending # express the regexp above with the code you wish you had
end
