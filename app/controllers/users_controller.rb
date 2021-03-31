class UsersController < ApplicationController
    # before_action :find_user, only: [:show, :edit, :update, :destroy]

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

    def show
        @user = User.find(params[:id])
        
    end

    def edit
        @user = User.find(params[:id])

        render :edit
    end

    def update
       @user = User.find(params[:id])
        if @user.valid?
            @user.update(user_params)
            redirect_to user_path(@user.id)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path
        end    
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to new_user_path
    end
   

    private

    def user_params
        params.require(:user).permit(:username, :password, :name, :age, :education)
    end

    def find_user
        @user = User.find(params[:id])
    end
end

