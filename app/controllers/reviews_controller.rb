class ReviewsController < ApplicationController
  def index
    render template: 'static_pages/index'
  end

  def new
    @review = Review.new
    @bakery = Bakery.find(params[:bakery_id])
  end

  def create
    @bakery = Bakery.find(params[:bakery_id])
    @review = Review.new(review_params)
    @review.bakery = @bakery
    @review.user = current_user

    if @review.save
      redirect_to @bakery, notice: 'New review was successfully created.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
