When /^I invite a user$/ do
  invite_user("test@example.com")
end

def invite_user(email_address)
  visit new_user_invitation_path 
  fill_in "Email", with: email_address
  click_button "Send an invitation"
  visit '/users/sign_out'
end

Then /^an invitation email should be sent$/ do
  invite_email = ActionMailer::Base.deliveries.last
  assert_equal "Invitation instructions", invite_email.subject
  assert_equal 'test@example.com', invite_email.to[0]
  assert_match(/Hello test@example.com/, invite_email.body.to_s)
end

Given /^I have received an invitation$/ do
  sign_up
  invite_user("new_user@example.com")
  #@invited_user = User.invite!(:email => "new_user@example.com", :name => "John Doe")
  @invited_user = User.last
end

When /^I follow the link in the invitation$/ do
  visit '/users/invitation/accept?invitation_token='+@invited_user.invitation_token
end

When /^I enter a password$/ do
  fill_in 'Name', with: "Test User"
  fill_in 'Password', with: "password"
  fill_in 'Password confirmation', with: "password"
  click_button 'Set my password'
end

Then /^I should have an account$/ do
  User.last.email.should == @invited_user.email
  User.last.invitation_accepted_at.should_not be_nil
end

Then /^my office should be the same as that of the invitor$/ do
  User.first.office.should == User.last.office
end

Given /^I have accepted an invitation$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I go to the create invitation page$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see 'You are not able to send invitations'$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^I send an invite to user "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I should see 'This user has already been invited'$/ do
  pending # express the regexp above with the code you wish you had
end
