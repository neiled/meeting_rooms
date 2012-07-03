def find_invitee
  @invitee ||= {name: "Invited User", email: "invite@example.com"}
end


Given /^I invite another user to the system$/ do
  find_invitee
  visit '/invitations/new'
  fill_in "Name", with: @invitee[:name]
  fill_in "Email", with: @invitee[:email]
  click_button "Send Invite"
end

Then /^an email should be sent to the invited user$/ do
  ActionMailer::Base.deliveries.last.to.should include(@invitee[:email])
end

When /^they follow the link in the email$/ do
  sign_up(Office.last.invitation_token, "invite@example.com")
end

Then /^they should be signed up to the office I was invited from$/ do
  user = User.first conditions: {email: "invite@example.com"}
  Office.count.should == 1
  user.office.should == Office.last
end

Given /^I have not received an invitation email$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I attempt to follow a link I've copied from someone else$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should not be signed up if I use my own email address$/ do
  pending # express the regexp above with the code you wish you had
end
