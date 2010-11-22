When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see the "([^"]*)" form$/ do |form_name|
  form_name.should == 'email'
  selector = 'form[id="new_user"]'
  page.should have_selector selector
  with_scope selector do |scope|
    # scope.should have_selector 'label[value="email"]'
    # scope.should have_selector 'input[type="text"][name="user[email]"]'
    # scope.should have_selector 'input[type="submit"][value="Sign Up"]'
  end
end

