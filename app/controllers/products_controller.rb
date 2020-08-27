class ProductsController < ApplicationController

  def index
    @product = Product.includes(:genre).where(genres: {is_active: true}).where(is_active: true)
  	@products = Product.includes(:genre).where(genres: {is_active: true}).where(is_active: true).page(params[:page]).per(8)
  	@genres = Genre.where(is_active: true)
  end

  def show
  	@product = Product.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.where(is_active: true)
  end

end
