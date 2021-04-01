class ChatRoomChannel < ApplicationCable::Channel
  def subscribed
    # この行を編集する
    stream_from "chat_room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # ==========ここから編集する==========
  def speak(data)
    ChatMessage.create!(
      content: data['chat_message'],
      user_id: current_user.id,
      chat_room_id: data['chat_room_id']
    )
  end
  # ==========ここまで編集する==========
end
