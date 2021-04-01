class ListingsController < ApplicationController
    


    def index
        @listings = Listing.all
    end

    def show
        @listing = Listing.find(params[:id])
    end

  

    



    # def reassign
    #     cat1.each do |cat|
    #         cat.field = "Hospitality"
    #     end
    # end
    
    
        # category_listing = Listing.all.find(category_id)
        # @category = Category.all.find(category_listing)
    
end
