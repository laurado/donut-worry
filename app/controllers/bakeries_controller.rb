class BakeriesController < ApplicationController
  def index
  end

  def show
    @bakery = Bakery.find(params[:id])
  end

  def new
    @bakery = Bakery.new
  end

  def create
    @bakery = Bakery.new(bakery_params)

    if @bakery.save
      flash[:notice] = 'Bakery was successfully created'
      redirect_to root_path
    else
      flash[:error] = 'Bakery was not created successfully'
      render :new
    end
  end

  private

  def bakery_params
    params.require(:bakery).permit(
      :name,
      :address,
      :city,
      :state,
      :zip,
      :description,
      :img_url
    )
  end
end
