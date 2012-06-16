def create_meeting_room
  @meeting_room = FactoryGirl.create(:meeting_room)
end
Given /^I create a new meeting room$/ do
  visit 'meeting_rooms/new'
  fill_in "Name", with: "Test Room"
  fill_in "Location description", with: "Somewhere"
  fill_in "Max people", with: "4"
  click_button "Create"

end

Then /^I should see the meeting room in the list of meeting rooms$/ do
  page.should have_content('Test Room')
end
