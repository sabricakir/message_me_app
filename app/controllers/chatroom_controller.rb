class ChatroomController < ApplicationController
    before_action :require_user, only: [:index]
    
    def index
        @messages = Message.all.order("created_at ASC")
    end
end