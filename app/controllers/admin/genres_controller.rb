class Admin::GenresController < ApplicationController
   # before_action :authenticate_admin!
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end 
  
  def create
    genre = Genre.new(genre_params)
    genre.save(genre_params)
    redirect_to admin_genres_path
    # genre.admin_id = current_admin.id
    # if genre.save(genre_params)
    #   flash[:notice] = "保存ができました！"
    #   redirect_to admin_genres_path
    # else
    #   flash.now[:alert] = "保存ができませんでした・・・"
    #   render :index
    # end
  end 
  
  def edit
    @genre = Genre.find(params[:id])
    # if @genre.user == current_user
    #   render :edit
    # else
    #   redirect_to admin_genres_path
    # end
  end 
  
  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
    # if genre.update(genre_params)
    #   flash[:notice] = "更新ができました！"
    #   redirect_to admin_genres_path
    # else
    #   render :edit
    #   flash.now[:alert] = "更新ができませんでした・・・"
    # end
  end 
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end