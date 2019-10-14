Feature: Booking incorrect mail

  Scenario: Login with incorrect credentials
    Given I open "https://www.booking.com" url
    When I wait until "SignIn" is clickable
    And I click "SignIn"
    And I wait until "EmailField" is present
    And I type text "sysrq0884@mail.ru" to "EmailField"
    And I wait until "NextButton" is clickable
    And I click "NextButton"
    And I wait until "EmailError" is present
    Then Text of "EmailError" should contain "Looks like there isn't an account associated with this email address"