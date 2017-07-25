class ReviewsController < ApplicationController
  def index
    render template: 'static_pages/index'
  end

  def edit
    @bakery = Bakery.find(params[:bakery_id])
    @review = Review.find(params[:id])
  end

  def update
      @review = Review.find(params[:id])
      @review.update(review_params)
      if @review.save
        flash[:notice] = "Review successfully updated"
        redirect_to bakery_path(@review.bakery)
      else
        flash[:alert] = "Unable to update. There was an error"
        redirect_to edit_bakery_review_path(@review.show, @review)
      end
    end


  def destroy
    review = Review.find(params[:id])
    @bakery = review.bakery
    if Review.destroy(review.id)
      flash[:notice] = "Your review has been deleted."
    else
      flash[:alert] = "Error deleting review."
    end
    redirect_to bakery_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating).merge(
      bakery: Bakery.find(params[:bakery_id])).merge(
        user: current_user
    )
  end

end
