class UserCategoriesController < ApplicationController

    def new
        @user_category = UserCategory.new
    end

    def create
        @user_category = UserCategory.create(user_category_params)
        if @user_category.valid?
            redirect_to user_category_path(@user_category.id)
        else 
            flash[:errors] = @user_category.errors.full_messages 
            redirect_to new_user_category_path
        end
    end


    private

    def user_category_params
        params.require(:user_category).permit(:user_id, :category_id)
    end
end
