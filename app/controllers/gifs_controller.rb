class GifsController < ApplicationController
  def index
    if current_user
      if params[:sort]
        @categories = Category.all
        @gifs = Gif.all.group(:image_path)
      else
        @gifs = Gif.all.group(:image_path, :id)
      end
    else
      render file:'/public/404'
    end
  end
end
