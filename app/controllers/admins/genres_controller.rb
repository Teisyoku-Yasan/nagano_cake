class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_genre, only: [:edit, :update]

  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def create
  	@genre = Genre.new(genre_params)
  	@genre.save
  	redirect_to request.referer, notice: "ジャンルを追加しました"
  end

  def edit
  end

  def update
  	 if @genre.update(genre_params)
  		redirect_to admins_genres_path, notice: "ジャンル情報を更新しました"
  	else
  		render :action => "edit"
  	end
  	
  end

  private

  def genre_params
  	params.require(:genre).permit(:name, :is_active)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end

end
