class MeetingRoomsController < ApplicationController
  def index
   @meeting_rooms = MeetingRoom.all 
  end

  def new
   @meeting_room = MeetingRoom.new 
  end

  def create
    @meeting_room = MeetingRoom.new(params[:meeting_room])
    if @meeting_room.save
      flash[:success] = "Meeting room created!"
      redirect_to meeting_rooms_path
    else
      render 'meeting_rooms/new'
    end
  end

end
