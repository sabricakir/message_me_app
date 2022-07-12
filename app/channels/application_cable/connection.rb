module ApplicationCable
  class Connection < ActionCable::Connection::Base

    identified_by :current_user

    def connect
            self.current_user = find_verified_user
            logger.add_tags "ActionCable", "User #{current_user.id}"
    end

    protected

    def find_verified_user # this checks whether a user is authenticated with devise
      if current_user = User.find(cookies[:user_id])
        current_user
      else
        reject_unauthorized_connection
      end
  end

  end
end