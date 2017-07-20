require "rails_helper"

feature "Authenticated user can update their profile information" do

  let!(:jackie) { User.create(
    first_name: 'Jackie',
    last_name: 'Ma',
    password: 'JackieIsMyMom',
    profile_photo: "http://i.imgur.com/jluf593.jpg",
    email: 'JackAttack16@email.com'
    )
  }
  scenario "Authenticated user updates their profile information" do
    visit root_path

    click_on "Log In"

    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Email", with: "JackAttack16@email.com"

    click_button "Log in"

    click_on "Edit Profile"

    expect(page).to have_content "Edit Profile"
    expect(page).to have_content "First name"
    expect(page).to have_content "Last name"
    expect(page).to have_content "Password"
    expect(page).to have_content "Profile photo"
    expect(page).to have_content "Email"

    fill_in "Current password", with: "JackieIsMyMom"

    expect(page).to have_field("First name", with: jackie.first_name)
    expect(page).to have_field("Last name", with: jackie.last_name)
    expect(page).to have_field("Email", with: jackie.email)

    click_button "Update"

    expect(page).to have_content "Your account has been updated successfully"
  end
end
