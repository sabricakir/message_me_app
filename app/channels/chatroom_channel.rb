class ChatroomChannel < ApplicationCable::Channel
  
  def subscribed

    stream_from "chatroom_channel"

    if current_user

      ActionCable.server.broadcast "chatroom_channel", 

      current_user.online = true
      current_user.save!

    end


  end

  def unsubscribed

    if current_user

      current_user.online = false
      current_user.save!      

    end

  end 

end
