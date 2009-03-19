Given /"(.*)" is an anonymous user/ do |name|
  visit '/logout'
end

Given /"(.*)" an unactivated user/ do |name|
  When "I go to the registration form"
  And "I fill in \"login\" with \"#{name}\""
  And "I fill in \"email\" with \"#{name}@mail.com\""
  And "I fill in \"password\" with \"secret\""
  And "I fill in \"password confirmation\" with \"secret\""
  When "I press \"Register\""
  Then "I should have a successful registration"
end

Then /^I should see the registration form$/ do
  response.should contain('Login')
  response.should contain('Email')
  response.should contain('Password')
  response.should contain('Password confirmation')
end

Then /^I should have a successful registration$/ do
  When 'I should see "Registration completed!"'
end

Then /^I should have an unsuccessful registration$/ do
  When 'I should not see "Registration completed!"'
end

Then /^I should see my account page$/ do
  When 'I should see "My Account"'
end

Then /^I should not see my account page$/ do
  When 'I should not see "My Account"'
end