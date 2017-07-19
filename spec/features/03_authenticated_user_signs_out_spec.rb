require "rails_helper"

feature "Authenticated user can sign out" do
  scenario "Authenticated user signs out successfully" do
    User.create(
    first_name: 'Jackie',
    last_name: 'Ma',
    password: 'JackieIsMyMom',
    profile_photo: "http://i.imgur.com/jluf593.jpg",
    email: 'JackieIsMyMom@email.com'
    )

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
