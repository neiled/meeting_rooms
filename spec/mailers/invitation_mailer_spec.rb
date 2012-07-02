require "spec_helper"

describe InvitationMailer do
  describe "send_invite" do
    let(:mail) { InvitationMailer.send_invite("Test User", "to@example.com") }

    it "should send the correct email" do
      mail.to.should eq(["to@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
