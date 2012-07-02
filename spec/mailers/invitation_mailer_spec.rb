require "spec_helper"

describe InvitationMailer do
  describe "send_invite" do
    let(:mail) { InvitationMailer.send_invite }

    it "renders the headers" do
      mail.subject.should eq("Send invite")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
