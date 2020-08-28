class HomeController < ApplicationController
    
    def top
    	@genres = Genre.where(is_active: true)
    	@all_ranks = Product.find(OrderDetail.group(:product_id).order('count(product_id) desc').limit(4).pluck(:product_id))
    end

    def about
    end

end
