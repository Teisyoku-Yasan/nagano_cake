class Admins::ProductsController < ApplicationController

	before_action :authenticate_admin!

	def index
		@product = Product.new
		@products = Product.page(params[:page]).reverse_order
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_products_path
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admins_product_path(@product.id)
		else
			render :edit
		end
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
	end

end
