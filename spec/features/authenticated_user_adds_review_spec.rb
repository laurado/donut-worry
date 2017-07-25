require 'rails_helper'

feature "authenticated users can add reviews" do
  let!(:jackie) do
    User.create(
      first_name: 'Jackie',
      last_name: 'Ma',
      password: 'JackieIsMyMom',
      profile_photo: "http://i.imgur.com/jluf593.jpg",
      email: 'JackAttack16@email.com'
    )
  end

  scenario "adds review successfully" do
    union_square_donuts = Bakery.create(
      name: 'Union Square Donuts',
      address: '20 Bow Street',
      city: 'Somerville',
      state: 'MA',
      zip: '02143',
      description: 'Cult donut maker offers unique sweet & savory flavors,
      pastries & java in modern, wood-clad digs.',
      img_url: 'www.image.com/1'
    )

    visit root_path
    click_on "Log In"
    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Email", with: "JackAttack16@email.com"
    click_button "Log in"

    visit new_bakery_review_path(union_square_donuts)

    expect(page).to have_content "New Review Form"

    fill_in "Rating", with: "5"
    fill_in "Description", with: 'Cult donut maker'

    click_button "Create Review"

    expect(page).to have_content "New review was successfully created."
  end

  scenario "adds a review for a bakery unsuccessfully" do
    union_square_donuts = Bakery.create(
      name: 'Union Square Donuts',
      address: '20 Bow Street',
      city: 'Somerville',
      state: 'MA',
      zip: '02143',
      description: 'Cult donut maker offers unique sweet & savory flavors,
      pastries & java in modern, wood-clad digs.',
      img_url: 'www.image.com/1'
    )

    visit root_path
    click_on "Log In"
    fill_in "Password", with: "JackieIsMyMom"
    fill_in "Email", with: "JackAttack16@email.com"
    click_button "Log in"

    visit new_bakery_review_path(union_square_donuts)

    expect(page).to have_content "New Review Form"

    click_button "Create Review"

    expect(page).to have_content "Rating can't be blank"
  end
end
