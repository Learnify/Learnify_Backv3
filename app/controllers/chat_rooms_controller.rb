class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
    render json: @chat_rooms
  end
  
  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    render json: @chat_room
    
  end
    
  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      render json: @chat_room, status: :created, location: @chat_room
    else
      render json: @chat_room.errors, status: :unprocessable_entity
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
