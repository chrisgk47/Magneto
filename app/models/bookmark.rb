class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :listing

    # def user_bookmarks
    #   @bookmarks = @user.bookmarks
    # end

    
    #  def new
    #    @bookmark = Bookmark.new

    #    @users = User.all

    #    @listings = Listing.all
    #  end
    

end
