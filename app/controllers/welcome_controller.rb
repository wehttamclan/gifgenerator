class WelcomeController < ApplicationController
  def index
    response = Faraday.get("http://api.giphy.com/v1/gifs/random?api_key=#{ENV['giphy_api_key']}&tag=burrito")
    data = JSON.parse(response.body, object_class: OpenStruct)
    @gif_url = data.data.image_original_url
  end

end
