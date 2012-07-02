require 'spec_helper'

describe Office do
  it "should generate an invite token when it is created" do
    office = FactoryGirl.create(:office)
    office.invitation_token.should_not be_nil
  end
end
