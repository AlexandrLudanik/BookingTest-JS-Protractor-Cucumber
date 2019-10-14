Feature: Booking login

  Scenario Outline: Login with correct credentials
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
    And I wait until "LOGO" is present
    Then "LOGO" should be visible

    Examples:
      | Login              | Password    |
      | sysrq08884@mail.ru | Testbooking |