require 'spec_helper'

describe User do
  it "should create a business if one doesn't exist" do
<<<<<<< HEAD
    user = FactoryGirl.create(:user)
=======
    user = User.create
>>>>>>> de759c96f7eb7ef6f728300446d07a4ba08fab6e
    user.office.should_not be_nil
  end
end
