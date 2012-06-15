class MeetingRoomsController < ApplicationController
  def new
   @meeting_room = MeetingRoom.new 
  end

end
