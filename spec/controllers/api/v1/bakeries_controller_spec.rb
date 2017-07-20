require 'rails_helper'


RSpec.describe Api::V1::BakeriesController, type: :controller do

  let!(:first_bakery) do Bakery.create(
    name: "Union Square Donuts",
    address: "20 Bow Street",
    city: "Somerville",
    state: "MA",
    zip: "02143",
    description: "Cult donut-maker offers unique sweet and savory flavors, pastries, and java in modern wood-clad digs",
    img_url: "http://static1.squarespace.com/static/51dacd5be4b0a4195e57886a/t/54622df0e4b0719cb5b6638a/1415720432271/USDlogo.png?format=1000w")
  end

  let!(:second_bakery) do Bakery.create(
    name: "Something Sweet Without Wheat",
    address: "19 6th Road",
    city: "Woburn",
    state: "MA",
    zip: "01801",
    description: "Snug colorful bakeshop lures locals with its range of homemade, gluten-free, and vegan desserts",
    img_url: "http://3.bp.blogspot.com/-sV8nvQ4Gdp4/TjrLSxQDz3I/AAAAAAAAAA4/CGBF679SyTU/s860/new%2Bblog%2Bpic.jpg")
  end

  describe "GET#index" do
    it "should return a list of all the bakeries" do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json['bakeries'].length).to eq 2
      expect(returned_json['bakeries'][0]["name"]).to eq "Union Square Donuts"
      expect(returned_json['bakeries'][0]["address"]).to eq "20 Bow Street"
      expect(returned_json['bakeries'][0]["city"]).to eq "Somerville"
      expect(returned_json['bakeries'][0]["state"]).to eq "MA"
      expect(returned_json['bakeries'][0]["zip"]).to eq "02143"
      expect(returned_json['bakeries'][0]["description"]).to eq "Cult donut-maker offers unique sweet and savory flavors, pastries, and java in modern wood-clad digs"
      expect(returned_json['bakeries'][0]["img_url"]).to eq "http://static1.squarespace.com/static/51dacd5be4b0a4195e57886a/t/54622df0e4b0719cb5b6638a/1415720432271/USDlogo.png?format=1000w"

      expect(returned_json['bakeries'][1]["name"]).to eq "Something Sweet Without Wheat"
      expect(returned_json['bakeries'][1]["address"]).to eq "19 6th Road"
      expect(returned_json['bakeries'][1]["city"]).to eq "Woburn"
      expect(returned_json['bakeries'][1]["state"]).to eq "MA"
      expect(returned_json['bakeries'][1]["zip"]).to eq "01801"
      expect(returned_json['bakeries'][1]["description"]).to eq "Snug colorful bakeshop lures locals with its range of homemade, gluten-free, and vegan desserts"
      expect(returned_json['bakeries'][1]["img_url"]).to eq "http://3.bp.blogspot.com/-sV8nvQ4Gdp4/TjrLSxQDz3I/AAAAAAAAAA4/CGBF679SyTU/s860/new%2Bblog%2Bpic.jpg"

    end
  end
end
