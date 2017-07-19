require 'rails_helper'

feature "Authenticated users can delete their account" do

  let!(:jackie) { User.create(first_name: 'Jackie',
    last_name: 'Ma', password: 'JackieIsMyMom',
    profile_photo: "http://i.imgur.com/jluf593.jpg",
    email: 'JackAttack16@gmail.com'
  )}
  scenario "user deletes account successfully" do
    visit new_user_session_path
    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Email", with: "JackAttack16@gmail.com"

    click_button "Log in"

    click_on "Edit Profile"

    expect(page).to have_content "Edit User"

    click_button "Cancel my account"

    expect(page).to have_content "Your account has been successfully cancelled."
    expect(page).to have_content "Donut Worry"
  end
end
