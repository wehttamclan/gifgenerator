class FavoritesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @favorite = @user.favorites.create(gif_id: params[:gif])
  end
end
