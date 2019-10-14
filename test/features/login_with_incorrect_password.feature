Feature: Booking incorrect password

  Scenario Outline: Login with incorrect credentials
    Given I open "https://www.booking.com" url
    When I wait until "SignIn" is clickable
    And I click "SignIn"
    And I wait until "EmailField" is present
    And I type text "<Login>" to "EmailField"
    And I wait until "NextButton" is clickable
    And I click "NextButton"
    And I wait until "PasswordField" is present
    And I type text "<Password>" to "PasswordField"
    And I wait until "SignInButton" is clickable
    And I click "SignInButton"
    And I wait until "PasswordError" is present
    Then Text of "PasswordError" should contain "<Error>"

    Examples:
      | Login              | Password   | Error                                                        |
      | sysrq08884@mail.ru | Testboking | The email and password combination you entered doesn't match |