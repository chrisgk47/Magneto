class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            redirect_to user_path(@user.id)
        else 
            flash[:errors] = @user.errors.full_messages 
            redirect_to new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        if @user.valid?
            redirect_to user_path(@user.id)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end    
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :name, :age, :education)
    end
end
