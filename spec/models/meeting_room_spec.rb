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
end
