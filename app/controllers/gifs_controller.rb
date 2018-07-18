class GifsController < ApplicationController
  before_action :require_admin, only: [:new, :create]

  def index
    if params[:sort]
      @gifs = Gif.all.includes(:categories)
    else
      @gifs = Gif.all.includes(:categories)
    end
  end


end
