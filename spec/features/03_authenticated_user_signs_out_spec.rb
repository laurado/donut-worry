require "rails_helper"
# As an authenticated user
# I want to sign out
# So that no one else can post bakeries or reviews on my behalf

# [] When signed in, the sign in link in the topbar is changed to a sign out link.
# [] Clicking the sign out link in the topbar signs out the user.
# [] When a user is signed out, they should not be able to post a new bakery
# [] When a user is signed out, they should not be able to post a new review

feature "Authenticated user can sign out" do
  scenario "Authenticated user signs out successfully" do
    User.create(first_name: 'Jackie', last_name: 'Ma', password: 'JackieIsMyMom', profile_photo: "http://i.imgur.com/jluf593.jpg", email: 'JackieIsMyMom@email.com')
    visit new_user_session_path
    expect(page).to have_content "Log in"

    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Email", with: "JackieIsMyMom@email.com"

    click_button "Log in"

    expect(page).to have_content "Sign Out"

    click_on "Sign Out"

    expect(page).to have_content "Signed out successfully"
  end

end
