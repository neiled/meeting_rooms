Feature: As an administrator
  I should be able to invite other people to join the office
  So that they can use the system to book meeting rooms

  Scenario: Inviting a user sends an email
    Given I sign up with valid user data
    When I invite a user
    Then an invitation email should be sent

  Scenario: Following the link in the invite allows to sign up
    Given I have received an invitation
    When I follow the link in the invitation
    And I enter a password
    Then I should have an account
    And my office should be the same as that of the invitor

  Scenario: Accepting an invite should not allow the user to send invitations
    Given I have accepted an invitation
    When I go to the create invitation page
    Then I should see 'You are not able to send invitations'

  Scenario: Shouldn't be able to invite someone that's already invited
    Given I send an invite to user "test@example.com"
    When I send an invite to user "test@example.com"
    Then I should see 'This user has already been invited'

  Scenario: Shouldn't be allowed to accept their own invitation



