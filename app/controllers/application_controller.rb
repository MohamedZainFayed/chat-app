class ApplicationController < ActionController::Base
    before_action :check_user

    private

        def check_user
            redirect_to "/new" if session[:user_id].nil?
        end
end
