class BakeriesController < ApplicationController
  def index
    render template: 'static_pages/index'
    @shows =
    if params[:search]
        Bakery.search(params[:search]).order("created_at DESC")
    end
  end

  def show
    @bakery = Bakery.find(params[:id])
  end
end
