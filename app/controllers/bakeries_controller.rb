class BakeriesController < ApplicationController
  def index
    if valid_search_params
      @bakery = Bakery.search(params[:search]).order("created_at DESC").first
      if @bakery
        redirect_to bakery_path(@bakery)
      else
        flash[:notice] = "No results found for '#{params[:search]}'"
        @bakeries = Bakery.all.order("created_at ASC")
        redirect_to root_path
      end
    end
  end

  def show
    @bakery = Bakery.find(params[:id])
    @user = current_user
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

  def valid_search_params
    params[:search] &&
    params[:search] != "" &&
    params[:search] != " " &&
    params[:search].length > 1
  end
end
