require 'rails_helper'

describe 'user visits gifs_path' do
  context "as default user" do
    it "can mark a gif as a favorite" do
      default_user = User.create(username: "junebug",
                                  password: "strongword",
                                  role: 0)
      category = Category.create(name: 'awesome', id: 1)
      gif = Gif.create(image_path: 'https://media1.giphy.com/media/l1J9NaQ12l1cZuVZS/giphy.gif', category_id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit gifs_path

      click_on "Add Favorite"

      visit user_path(default_user)
    end
    it "sees all favorites on the user's show page" do
      default_user = User.create(username: "junebug",
                                  password: "strongword",
                                  role: 0)
      category = Category.create(name: 'awesome', id: 1)
      gif_1 = Gif.create(image_path: 'https://media1.giphy.com/media/l1J9NaQ12l1cZuVZS/giphy.gif', category_id: 1)
      gif_2 = Gif.create(image_path: 'https://media3.giphy.com/media/Z2lbq4wzwu5y0/giphy.gif', category_id: 1)
      favorite_1 = default_user.favorites.create(gif_id: gif_1.id)
      favorite_2 = default_user.favorites.create(gif_id: gif_2.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(default_user)

      visit user_path(default_user)
    end
  end
end
