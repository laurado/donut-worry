class Api::V1::BakeriesController < ApplicationController
  def index
    render json: Bakery.all, adapter: :json
  end

  def create
    data = JSON.parse(request.body.read)
    new_bakery = Bakery.create(
      name: data["name"],
      address: data["address"],
      city: data["city"],
      state: data["state"],
      zip: data["zip"],
      description: data["description"],
      img_url: data["img_url"]
    )
  end
end
