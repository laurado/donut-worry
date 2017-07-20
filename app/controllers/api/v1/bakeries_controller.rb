class Api::V1::BakeriesController < ApplicationController
  def index
    render json: Bakery.all, adapter: :json
  end
end
