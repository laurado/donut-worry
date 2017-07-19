require "rails_helper"

# As an unauthenticated user
# I want to sign in
# So that I can post bakeries and review them

# [] When signed in, the sign in link in the topbar is changed to a sign out link.
# [] When signed in, the user can post new bakeries and reviews.
# [] If the user is not signed in, they are prompted to sign in before they may post a review.

feature "Authenticated user can sign in" do
  scenario "Authenticated user signs in successfully" do
    User.create(first_name: 'Jackie', last_name: 'Ma', password: 'JackieIsMyMom', profile_photo: "http://i.imgur.com/jluf593.jpg", email: 'JackieIsMyMom@email.com')
    visit new_user_session_path
    expect(page).to have_content "Log in"

    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Email", with: "JackieIsMyMom@email.com"

    click_button "Log in"

    expect(page).to have_content "User signed in successfully"
    expect(page).to have_content "Donut Worry"
  end

  scenario "Authenticated user does not provide proper information to log in" do
    visit new_user_session_path
    expect(page).to have_content "Log in"

    click_button "Log in"

    expect(page).to have_content "Invalid Email or Password."

  end
end
