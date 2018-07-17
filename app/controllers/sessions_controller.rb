class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      # TODO flash message username/password combo wasn't valid
      render :new
    end
  end
end
