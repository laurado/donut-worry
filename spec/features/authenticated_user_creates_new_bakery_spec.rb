require 'rails_helper'
# As an authenticated user
# I want to add a bakery
# So that others can review it
# [] clicking the 'add new bakery' button should display a form for creating a new bakery
# [] Visiting the `/bakeries/new` path should display a form for creating a new bakery.
# [] A bakery must have a name, address, city, state, and zip code. It can optionally have a description.
# [] When adding a new bakery, if I fill out the form correctly, I should see a notification that the bakery was added correctly.
# [] When adding a new bakery, if I fill out the form correctly, I should see the page for the newly created bakery.
# [] When adding a new bakery, if I fill out the form incorrectly and submit the form, I should see the partially completed form and the corresponding validation errors.

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
    expect(page).to have_content "Union Square Donuts"
    expect(page).to have_content "20 Bow Street"
    expect(page).to have_content 'Cult donut maker'
  end

  # scenario "adds a review for a bakery unsuccessfully" do
  #
  #   visit root_path
  #
  #   click_button "Add a Bakery"
  #   expect(page).to have_content "New Bakery Form"
  #
  #   click_button "Create Bakery"
  #
  #   expect(page).to have_content "Name can't be blank"
  #   expect(page).to have_content "Address can't be blank"
  #   expect(page).to have_content "City can't be blank"
  #   expect(page).to have_content "State can't be blank"
  #   expect(page).to have_content "Zip can't be blank"
  # end
end
