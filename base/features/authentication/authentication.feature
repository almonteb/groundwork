Feature: Authentication
In order to use the full extent of the application
A confirmed but anonymous user of the system
Must give valid credentials before using the application

Scenario: Display login form to anonymous users
Given "hector" is an anonymous user
When I go to the login page
Then I should see a login form

Scenario: Redirect to account page when user is logged in
Given "hector" a logged in user
When I go to the login page
Then I should be logged in

Scenario: Allow login of a user with valid credentials
Given "hector" a confirmed user with password "supersecret"
When I go to the login page
And I fill in "login" with "hector"
And I fill in "password" with "supersecret"
And I press "Login"
Then I should be logged in

Scenario Outline: Not allow login of a user with bad credentials
Given "hector" a confirmed user with password "secret"
When I go to the login page
And I fill in "login" with "<login>"
And I fill in "password" with "<password>"
And I press "Login"
Then I should not be logged in

    Examples:
      | login   |    password    |
      | hector  |    badsecret   |
      | hector  |                |
      | unknown |     secret     |
      | unknown |    badsecret   |
      | unknown |                |
      |         |                |
      |         |     secret     |
      |         |    badsecret   |

Scenario: Not allow login of an unconfirmed user
Given "hector" an unconfirmed user with password "secret"
When I go to the login page
And I fill in "login" with "hector"
And I fill in "password" with "secret"
And I press "Login"
Then I should not be logged in
And I should see "not confirmed"

Scenario: Allow a confirmed user to login and be remembered
Given "hector" a confirmed user with password "secret"
When I go to the login page
And I fill in "login" with "hector"
And I fill in "password" with "secret"
And I check "Remember me"
And I press "Login"
Then I should be logged in
