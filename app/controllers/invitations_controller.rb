
class InvitationsController < ApplicationController
  def new
  end

  def create
    InvitationMailer.send_invite(params[:name], params[:email]).deliver
    redirect_to :root, notice: "Invitation Sent"
  end
end
