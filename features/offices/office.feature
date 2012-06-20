Feature: As an administrator
  All of my rooms should be related to a specific office
  So that I don't see rooms made by other people

  Scenario: Office is created on new administrator creation
    Given I sign up with valid user data
    Then I should have an associated office

