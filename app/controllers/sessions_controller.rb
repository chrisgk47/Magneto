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
            flash[:error] = "Invalid Username or Password!"
            redirect_to new_login_path
        end
    end
    
    # def new
    # end

    # def create
    #     user = User.find_by(username: params[:session][:username].downcase)
    #     if user && user.authenticate(params[:session][:password])
    #       log_in user
    #       redirect_to user_path(user)
    #     else
    #       flash.now[:danger] = 'Invalid email/password combination'
    #       redirect_to new_login_path
    #     end
    # end

    def destroy
        session[:user_id]
        redirect_to login_path
    end
    
end
