def create_meeting_room
  @meeting_room = FactoryGirl.create(:meeting_room)
end
Given /^I create a new meeting room$/ do
  visit 'meeting_rooms/new'
  fill_in "Name", with: "Test Room"
  fill_in "Location Description", with: "Somewhere"
  fill_in "Max People", with: "4"
  click_button "Create"
end

Then /^I should see the meeting room in the list of meeting rooms$/ do
  pending # express the regexp above with the code you wish you had
end
