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

    # def create
    #     listing = Listing.find(params[:listing_id])
    #     bookmark = current_user.bookmarks.build(listing: listing)

    #     if bookmark.save
    #         flash[:notice] = "Bookmarked Listing"
    #     else
    #         flash[:alert] = "Couldn't bookmark this listing"
    #     end
    #     redirect_to [listing.title, listing]
    # end

    # def create
    #     @user = User.find(params[:user_id])
    #     @bookmark = Bookmark.find(params[:id])

    #     @bookmark = Bookmark.create(bookmark_params)
    #     if @bookmark.valid?
    #         redirect_to user_path(@bookmark.user)
    #     else
    #         flash[:error] = bookmark.errors.full_messages
    #         redirect_to new_bookmark_path
    #     end
    # end

    def create
        listing = Listing.find(params[:listing_id])
        current_user.bookmark(listing)
        redirect_to current_user
    end


    def edit
        @bookmark = Bookmark.find(params[:id])
    end

        
    def update
        @bookmark = Bookmark.find(params[:id])
        @bookmark.update(bookmark_params)
        if @bookmark.valid?
            redirect_to bookmark_path(@bookmark.id)
        else
            flash[:error] = @bookmark.errors.full_messages
            redirect_to edit_bookmark_path
        end
    end

    

    private

    def bookmark_params
        byebug
        params.require(:bookmark).permit(:listing_id)
    end
end


# :user_id, :status