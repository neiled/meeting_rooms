require 'spec_helper'

describe MeetingRoom do
  before do
    @room = FactoryGirl.build(:meeting_room)
  end

  subject {@room}

  it {should be_valid}

  describe "when name is not present" do
    before { @room.name = "" }
    it {should_not be_valid}
  end

  describe "when location description is not present" do
    before { @room.location_description = "" }
    it { should_not be_valid }
  end

  describe "when maximum capacity is not present" do
    before { @room.max_people = nil }
    it { should_not be_valid }
  end

end
