class GenresController < ApplicationController

	def show
		@genres = Genre.all
		@genre = Genre.find(params[:id])
		@products = @genre.products.page(params[:page]).per(8)
		@product = @genre.products.all
	end

end
