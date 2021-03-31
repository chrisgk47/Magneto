class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :listing

    # def user_bookmarks
    #   @bookmarks = @user.bookmarks
    # end

    

end
