Feature: Check available rooms in the hotel

  Scenario Outline: should find more than "<Rooms>" rooms in hotel "<Hotel>" in city "<City>" for two persons on nearest weekend
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
    And I click "<Hotel>" in "ListOfHotels"
    And I switch to next tab
    And I wait until "ReserveButton" is clickable
    And I click "ReserveButton"
    And I wait until "ListOfRooms" is present
    Then Count of "ListOfRooms" should more "<Rooms>"

    Examples:
      | City  | Hotel       | Rooms |
      | Minsk | Hotel Minsk | 3     |