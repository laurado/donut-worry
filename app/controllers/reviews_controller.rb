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

end
