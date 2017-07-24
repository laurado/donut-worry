require "rails_helper"

feature "user searches for bakeries" do
  before(:each) do
    @user = FactoryGirl.create(:user)
    login_as(@user, scope: :user)

    @union_square_donuts = Bakery.create(
      bakery: "Union Square Donuts",
      description: "best donuts in MA", average_rating: 5
    )
  end

  scenario "sees bakery on page after searching" do

    visit root_path

    fill_in('search', with: 'Union Square')
    click_button "Search"

    expect(current_path).to eq "/bakeries"
    expect(page).to have_css("img[src*='http://static1.squarespace.com/static/51dacd5be4b0a4195e57886a/t/54622df0e4b0719cb5b6638a/1500755411287/']")
  end

  scenario "does not see bakeries unrelated to search" do

    kanes_donuts = Bakery.create(
      name: "Kane's Donuts",
      description: "awesome donut shop", average_rating: 5
    )

    visit root_path

    fill_in('search', with: 'Union Square')
    click_button "Search"

    expect(current_path).to eq "/bakeries"
    expect(page).to_not have_content kanes_donuts.name
  end

  scenario "index page is shown as is when search bar is empty" do

    kanes_donuts = Bakery.create(
      name: "Kane's Donuts",
      description: "awesome donut shop", average_rating: 5
    )

    visit root_path

    click_button "Search"

    expect(current_path).to eq "/bakeries"
    expect(page).to have_css("img[src*='http://static1.squarespace.com/static/51dacd5be4b0a4195e57886a/t/54622df0e4b0719cb5b6638a/1500755411287/']")
  end
end
