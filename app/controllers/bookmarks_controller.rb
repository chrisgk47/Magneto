 class BookmarksController < ApplicationController


    def index
        @bookmarks = Bookmark.all
        @user.bookmarks
    end

    def show
        @bookmark = Bookmark.find(params[:id])
    end

    def new
        @bookmark = Bookmark.new

        @users = User.all
        @listings = Listing.all
    end

    def create
        @user = User.find(params[:user_id])

        @bookmark = Bookmark.create(bookmark_params)
        if @bookmark.valid?
            redirect_to user_path(@bookmark.user)
        else
            flash[:errors] = bookmark.errors.full_messages
            redirect_to new_bookmark_path
        end
    end

    
    

    private

    def bookmark_params
        params.require(:bookmark).permit(:user_id, :listing_id, :status)
    end
end
