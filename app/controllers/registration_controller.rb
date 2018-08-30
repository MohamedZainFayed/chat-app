class RegistrationController < ApplicationController
    skip_before_action :check_user

    def new
        @user = User.new
    end

    def create
        @user = User.create user_params
        if @user.save
            session[:user_id] = @user.id
            redirect_to "/"
        else
            flash[:danger] = "User name exists!"
            redirect_to "/new"
        end
    end

    private
        
        def user_params
            params[:user][:last_seen] = Time.now
            params.required(:user).permit(:name, :last_seen)
        end
end
