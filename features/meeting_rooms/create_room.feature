Feature: As an administrator of the system
  I want to be able to allow people to book meeting rooms
  By creating meeting rooms in the system

  Scenario: Creating a new room
    Given I am logged in
    And I create a new meeting room
    Then I should see the meeting room in the list of meeting rooms
