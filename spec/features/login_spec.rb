require 'rails_helper'

=begin
As a registered user
When I visit '/'
and I click on a link that says "I already have an account"
Then I should see a login form
and I can enter my username and password
and submit the form
and see a welcome message with my username
and my user ID is stored in a session
and I should no longer see the link that says "I already have an account"
and I should see a link that says "Log out"
=end

describe 'login workflow' do
  it 'allows registered users to log in succsessfully' do
    user = User.create(username: 'matt', password: 'strongword')

    visit root_path
    click_on "Sign In"

    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Log Out")
    expect(page).to_not have_content("I already have an account")
  end
  it 'allows registered users to log out succsessfully' do
    user = User.create(username: "mark", password: "asdf", role: 0)

    visit root_path
    click_on 'Sign Up'

    expect(current_path).to eq(new_user_path)

    fill_in :user_username, with: user.username
    fill_in :user_password, with: user.password

    click_on "Create User"
    click_on "Log Out"
    
    expect(current_path).to eq(root_path)
    expect(page).to have_button("Sign In")
  end
end
