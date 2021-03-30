 class BookmarksController < ApplicationController


    def index
        @bookmarks = Bookmark.all
    end

    def show
        @bookmark = Bookmark.find(params[:id])
    end

    def new
        @bookmark = Bookmark.new
    end

    def create
        @bookmark = Bookmark.create(bookmark_params)
        if @bookmark.valid?
            redirect_to bookmark_path(@bookmark.id)
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
