class Admin::GifsController < GifsController

  def new
    @gif = Gif.new
    @categories = Category.order(:name)
  end

  def create
    category_id = gif_params[:category_id]
    category = Category.find(category_id).name
    response = Faraday.get("http://api.giphy.com/v1/gifs/random?api_key=#{ENV['giphy_api_key']}&tag=#{category}")
    data = JSON.parse(response.body, object_class: OpenStruct) # symbolize_names: true
    image_path = data.data.image_original_url # data[:data][:image_original_url]
    Gif.create(image_path: image_path, category_id: category_id)
    redirect_to gifs_path
  end

  private
    def gif_params
      params.require(:gif).permit(:category_id)
    end
end
