class ChatroomController < ApplicationController

    def index
        @messages = Message.all.order("created_at ASC")
    end
end