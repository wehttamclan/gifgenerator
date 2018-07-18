require "rails_helper"

describe "User visits categories new page" do
  context "as admin" do
    it "allows admin to fill out form that creates category" do
	   admin = User.create(username: "matt",
                         password: "strongword",
                         role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path

      fill_in :category_name, with: 'cheeseburg'

      click_on "Create Category"

      expect(current_path).to eq(new_admin_category_path)
      expect(page).to have_content(Category.last.name)
    end
    it "allows admin to fill out form that creates gif" do
	    admin = User.create(username: "matt",
                          password: "strongword",
                          role: 1)
      simpsons = Category.create(name: 'simpsons', id: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path

      select 'simpsons'

      click_on "Create Gif"

      expect(current_path).to eq(gifs_path)
      expect(page).to have_content(Gif.last)
    end
  end
end



    expect(current_path).to eq("/companies/#{@company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("Denver")
