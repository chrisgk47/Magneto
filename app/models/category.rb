class Category < ApplicationRecord

    has_many :listings
    has_many :user_categories

    has_many :users, through: :user_categories
    has_many :bookmarks, through: :listings 
end
