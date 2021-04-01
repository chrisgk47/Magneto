 class BookmarksController < ApplicationController


    def index
        @bookmarks = Bookmark.all

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
        # @user = User.find(params[:user_id])
        # @bookmark = Bookmark.find(params[:id])

        @bookmark = Bookmark.create(bookmark_params)
        if @bookmark.valid?
            redirect_to user_path(@bookmark.user)
        else
            flash[:error] = bookmark.errors.full_messages
            redirect_to listing_path(params[:listing_id])
        end
    end


    def destroy
        @bookmark = Bookmark.find(params[:id])
        @bookmark.listing.destroy
    end
    

    private

    def bookmark_params
    
        params.permit(:listing_id, :user_id)
    end
end

