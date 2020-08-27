class Admins::ProductsController < ApplicationController



	def index
		@product = Product.new
		@products = Product.page(params[:page])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to admins_product_path(@product), notice: "新しい商品を追加しました"
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
			redirect_to admins_product_path(@product.id), notice: "商品情報を更新しました"
		else
			render :edit
		end
	end

	private
	def product_params
		params.require(:product).permit(:genre_id, :name, :image, :introduction, :price, :is_active)
	end

end
