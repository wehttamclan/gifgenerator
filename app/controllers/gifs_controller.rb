class GifsController < ApplicationController

  def index
    if params[:sort]
      @categories = Category.all
      @gifs = Gif.all
    else
      @gifs = Gif.all
    end
  end

end
