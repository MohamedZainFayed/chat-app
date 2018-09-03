class ChatController < ApplicationController
    before_action :update_last_seen

    def index
        @user = User.find_by_id(session[:user_id])
        @users = User.active
    end

    def load_chat
        data = Message.where(sender_id: [session[:user_id], params[:recip].to_i]).where(recipient_id: [session[:user_id], params[:recip].to_i])
        respond_to do |f|
            f.js { render json: data.to_json}
        end
    end

    def add_message
        Message.create sender_id: session[:user_id], recipient_id: params[:recip], content: params[:content]
        Pusher.trigger('my-channel', 'my-event', {
            sender: session[:user_id], recipient: params[:recip].to_i
        })
        respond_to do |f|
            f.js {}
        end
    end

    private

        def update_last_seen
            user = User.find_by_id(session[:user_id])
            user.update_attributes!(last_seen: Time.now)
        end
end
