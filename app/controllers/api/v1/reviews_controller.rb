class Api::V1::ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

  def update
    review = Review.find(params[:id])
    vote = Vote.find_or_create_by(user: current_user, review: review)
    user_email = review.user

    if params["vote"] == "up" && vote.value < 1
      vote.value += 1
      review.votes += 1
      vote.save!
      review.save!
      ReviewMailer.review_email(user_email).deliver

      render json: {
        status: 201,
        message: "successfully voted on a review",
        review: review
      }.to_json
    elsif params["vote"] == "down" && vote.value > -1
      vote.value -= 1
      review.votes -= 1
      vote.save!
      review.save!
      ReviewMailer.review_email(user_email).deliver

      render json: {
        status: 201,
        message: "successfully voted on a review",
        review: review
      }.to_json
    else
      render json: {
        status: 500,
        review: review
      }.to_json
    end
  end
end
