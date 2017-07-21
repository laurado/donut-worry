class Api::V1::BakeriesController < ApplicationController
  def index
    render json: Bakery.all, adapter: :json
  end

  def show
    bakery = Bakery.find(params[:id])
    reviews = bakery.reviews.order(created_at: :desc)

    render json: { bakery: bakery, reviews: reviews }, adapter: :json
  end
end
