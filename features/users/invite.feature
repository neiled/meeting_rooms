Feature: As an administrator
  I need to be able to invite other people to the system
  So that they can book rooms for themselves

  Scenario: Inviting a user sends them an email
    Given I sign up with valid user data
    And I invite another user to the system
    Then an email should be sent to the invited user

  Scenario: Receiving an email allows a user to sign up
    Given I sign up with valid user data
    And I invite another user to the system
    When they follow the link in the email
    And I sign up with valid user data
    Then they should be signed up to the office I was invited from

  Scenario: Not receiving an email doesn't allow a user to sign up
    Given I have not received an invitation email
    When I attempt to follow a link I've copied from someone else
    Then I should not be signed up if I use my own email address
