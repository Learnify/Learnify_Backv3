class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    payload = {
      room_id: message.conversation.id,
      content: message.content,
      sender: message.sender,
      participants: message.conversation.users.collect(&:id)
    }
    ActionCable.server.broadcast "chat_rooms_#{message.chat_room.id}_channel",
                                 message: render_message(message)
  end
  
  def build_room_id(id)
    "ChatRoom-#{id}"
  end
    
  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
  end
end