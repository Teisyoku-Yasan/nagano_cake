class GenresController < ApplicationController

	def show
		@genres = Genre.where(is_active: true)
		@genre = Genre.find(params[:id])
		@products = @genre.products.where(is_active: true).page(params[:page]).per(8)
		@product = @genre.products.where(is_active: true)
	end

end
