class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def show
        @category = Category.find(params[:id])
    end

    
    


#     <li>Hospitality</li> 
# <li>Education</li>  
# <li>Engineering </li> 
# <li>Journalism</li> 
# <li>Manufacturing</li> 
# <li>Transportation</li> 
# <li>Government</li> 
# <li>Environment</li> 
# <li>Communications</li> 
# <li>Business</li>
    
end
