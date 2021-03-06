class Listing < ApplicationRecord

    belongs_to :category
    
    has_many :bookmarks
    has_many :users, through: :bookmarks
end
