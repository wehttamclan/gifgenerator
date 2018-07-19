class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if current_user
      @user = User.includes(:gifs).find(params[:id])
      @favorites = @user.gifs.all
    else
      render file:'/public/404'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
