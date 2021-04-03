class UsersController < ApplicationController
    # before_action :find_user, only: [:show, :edit, :update, :destroy]
     skip_before_action :logged_in?, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params(:username, :password, :name, :age, :education))

        if @user.valid?
            cookies[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else 
            flash[:errors] = @user.errors.full_messages 
            redirect_to new_user_path
        end
    end
  
    def bookmark(listing)
        bookmarks.new(listing_id: listing.id)
    end

    def show
        @user = User.find(params[:id])
        if @current_user == @user 
            render :show
          else  
            flash[:message] = "You can only access your own profile"
            redirect_to users_path
          end  
    end

    def edit
        @user = User.find(params[:id])

        # render :edit
    end

    def update
       @user = User.find(params[:id])
        # if @user.valid?
        @user.assign_attributes(user_params(:password))
        @user.save(validate: false)
        redirect_to user_path(@user)
        # else
        #     flash[:errors] = @user.errors.full_messages
        #     redirect_to edit_user_path
        # end  
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to new_user_path
    end
   

    private

    # def user_params
    #     params.require(:user).permit(:username, :password, :name, :age, :education)
    # end
    def user_params(*args)
        params.require(:user).permit(*args)
    end

    def find_user
        @user = User.find(params[:id])
    end
end


# def create
#     @user = User.create(user_params)
    
#     if @user.valid?
#         redirect_to user_path(@user.id)
#     else 
#         flash[:errors] = @user.errors.full_messages 
#         redirect_to new_user_path
#     end
# end