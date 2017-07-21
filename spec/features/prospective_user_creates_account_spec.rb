require "rails_helper"

feature "New users can create an account" do
  scenario "New user creates account successfully" do

    visit new_user_registration_path
    expect(page).to have_content "Sign Up"

    fill_in "First Name", with: "Jackie"
    fill_in "Last Name", with: "Ma"
    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Password confirmation", with: "JackieIsMyMom"
    fill_in "Email", with: "JackieIsMyMom@email.com"
    attach_file "Profile photo",
      "#{Rails.root}/spec/support/images/featmeme.jpg"

    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully"
    expect(page).to have_content "Donut Worry"
  end

  scenario "New user does not provide proper information to create"\
  " a new account" do

    visit new_user_registration_path
    expect(page).to have_content "Sign Up"

    click_button "Sign up"

    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Password can't be blank"
  end
end
