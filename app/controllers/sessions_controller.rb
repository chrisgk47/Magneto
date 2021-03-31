class SessionsController < ApplicationController

    skip_before_action :logged_in?, only: [:new_login, :login]
    
    def new_login
    end

    def login
        user = User.find_by(username: params[:session][:username])

        if user && user.authenticate(params[:session][:password])

            cookies[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Your Username or Password is incorrect"
            redirect_to new_login_path
        end
    end
    
end
