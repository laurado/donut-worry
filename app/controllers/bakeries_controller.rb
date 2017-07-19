class BakeriesController < ApplicationController
  def index
    render template: 'static_pages/index'
  end

  def show
    @bakery = Bakery.find(params[:id])
  end
end
