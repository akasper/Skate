When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see the "([^"]*)" form$/ do |form_name|
  form_name.should == 'email'
  Then 'I should see /Email/ within "form"'
  Then 'I should see a "Sign Up" button within "form"'
end

Then /^I should see a "([^"]*)" button within "([^"]*)"$/ do |name, selector|
  Then "I should see \"input[type='submit',value='#{name}']\" within \"#{selector}\""
end
