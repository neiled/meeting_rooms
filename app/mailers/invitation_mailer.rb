class InvitationMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.send_invite.subject
  #
  def send_invite(name, email)
    @greeting = "Hi"

    mail to: email
  end
end
