class User < ApplicationRecord
  

    has_many :user_categories
    has_many :bookmarks

    has_many :categories, through: :user_categories
    has_many :listings, through: :bookmarks

    has_secure_password
    
end
