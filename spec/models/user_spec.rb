require 'spec_helper'

describe User do
  it "should create a business if one doesn't exist" do
    user = FactoryGirl.create(:user)
    user.office.should_not be_nil
  end
end
