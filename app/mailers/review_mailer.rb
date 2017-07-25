class ReviewMailer < ApplicationMailer
  default from: 'notifications@donut-worry.com'

  def new_review(review)
    @review = review
    binding.pry

    mail(
      to: review.bakery.user.email,
      subject: "New Review On Your Bakery"
    )
  end
end
