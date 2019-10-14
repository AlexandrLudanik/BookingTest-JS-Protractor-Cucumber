Feature: Booking incorrect password

  Scenario: Login with incorrect credentials
    Given I open "https://www.booking.com" url
    When I wait until "SignIn" is clickable
    And I click "SignIn"
    And I wait until "EmailField" is present
    And I type text "sysrq08884@mail.ru" to "EmailField"
    And I wait until "NextButton" is clickable
    And I click "NextButton"
    And I wait until "PasswordField" is present
    And I type text "Testboking" to "PasswordField"
    And I wait until "SignInButton" is clickable
    And I click "SignInButton"
    And I wait until "PasswordError" is present
    Then Text of "PasswordError" should contain "The email and password combination you entered doesn't match"