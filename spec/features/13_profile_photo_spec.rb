require "rails_helper"

feature "profile photo" do
  scenario "user uploads a profile photo" do
    visit root_path
    click_link "Sign Up"

    fill_in "First Name", with: "Ash"
    fill_in "Last Name", with: "Campbell"
    fill_in "Email", with: "ash@s-mart.com"
    fill_in "Password", with: "boomstick!3vilisd3ad"
    fill_in "Password confirmation", with: "boomstick!3vilisd3ad"
    attach_file "Profile photo", "#{Rails.root}/spec/support/images/featmeme.jpg"
    click_button "Sign up"
  end
end
