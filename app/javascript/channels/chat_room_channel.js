import consumer from "./consumer";

// この行を編集する
const appChatRoom = consumer.subscriptions.create("ChatRoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const chatMessages = document.getElementById('chat-messages');
    chatMessages.insertAdjacentHTML('beforeend', data['chat_message']);
  },

  // ==========ここから編集する==========
  speak: function(chat_message, chat_room_id) {
    return this.perform('speak', { chat_message: chat_message, chat_room_id: chat_room_id });
  }
  // ==========ここまで編集する==========
});

// ==========ここから追加する==========
if(/chat_rooms/.test(location.pathname)) {
  $(document).on("keydown", ".chat-room__message-form_textarea", function(e) {
    if (e.key === "Enter") {
      const chat_room_id = $('textarea').data('chat_room_id')
      appChatRoom.speak(e.target.value, chat_room_id);
      e.target.value = '';
      e.preventDefault();
    }
  })
}
// ==========ここまで追加する==========
