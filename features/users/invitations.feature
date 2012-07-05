Feature: As an administrator
  I should be able to invite other people to join the office
  So that they can use the system to book meeting rooms

  Scenario: Inviting a user sends an email
    Given I sign up with valid user data
    When I invite a user
    Then an invitation email should be sent


