require 'rails_helper'

feature "authenticated users can add bakeries" do
  let!(:jackie) do
    User.create(
      first_name: 'Jackie',
      last_name: 'Ma',
      password: 'JackieIsMyMom',
      profile_photo: "http://i.imgur.com/jluf593.jpg",
      email: 'JackAttack16@email.com'
    )
  end

  scenario "adds bakery successfully" do
    visit root_path
    click_on "Log In"
    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Email", with: "JackAttack16@email.com"
    click_button "Log in"

    click_link "Add a Bakery"
    expect(page).to have_content "New Bakery Form"

    fill_in "Name", with: "Union Square Donuts"
    fill_in "Address", with: "20 Bow Street"
    fill_in "City", with: 'Somerville'
    fill_in "State", with: 'MA'
    fill_in "Zip", with: '12345'
    fill_in "Description", with: 'Cult donut maker'
    fill_in "Img url", with: 'www.image.com/1'
    click_button "Create Bakery"

    expect(page).to have_content "Bakery was successfully created"
  end

  scenario "adds a review for a bakery unsuccessfully" do
    visit root_path
    click_on "Log In"
    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Email", with: "JackAttack16@email.com"
    click_button "Log in"

    visit root_path

    click_link "Add a Bakery"
    expect(page).to have_content "New Bakery Form"

    click_button "Create Bakery"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Address can't be blank"
    expect(page).to have_content "City can't be blank"
    expect(page).to have_content "State can't be blank"
    expect(page).to have_content "Zip can't be blank"
  end
end
