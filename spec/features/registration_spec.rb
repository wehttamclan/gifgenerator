require 'rails_helper'

=begin
As a visitor
When I visit '/'
and I can click a link that says "Sign Up to Be a User"
and I can enter registration details in a form
and submit that form
Then I should see a welcome message with my username
and my user details have been saved in the database.
=end

describe 'registration workflow' do
  it 'submits a registration form successfully' do
    username = 'bob'

    visit root_path

    click_on "Sign Up"

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: username
    fill_in :user_password, with: 'strongword'

    click_on "Create User"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Welcome, #{username}!")
  end
end
