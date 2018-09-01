class ChatController < ApplicationController
    before_action :update_last_seen

    def index
        @user = User.find_by_id(session[:user_id])
        @users = User.active
    end

    private

        def update_last_seen
            user = User.find_by_id(session[:user_id])
            user.update_attributes!(last_seen: Time.now)
        end
end
