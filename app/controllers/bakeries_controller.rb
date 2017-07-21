class BakeriesController < ApplicationController
  def index
  end

  def show
    @bakery = Bakery.find(params[:id])
  end

  def new
  end

  def create
  end
end
