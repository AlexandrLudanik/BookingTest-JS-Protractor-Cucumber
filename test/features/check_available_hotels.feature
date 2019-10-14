Feature: Check available hotels in the city

  Scenario Outline: Should find more than "<Hotels>" available hotels in the city "<City>" for two persons on nearest weekend
    Given I open "https://www.booking.com" url
    When I wait until "SearchCityField" is present
    And I type text "<City>" to "SearchCityField"
    And I wait until "DateField" is present
    And I click "DateField"
    And I wait until "NearestSaturday" is present
    And I click "NearestSaturday"
    And I wait until "NearestSunday" is present
    And I click "NearestSunday"
    And I wait until "SearchButton" is clickable
    And I click "SearchButton"
    And I wait until "ListOfHotels" is present
    Then Count of "ListOfHotels" should more "<Hotels>"

    Examples:
      | City  | Hotels |
      | Minsk | 3      |