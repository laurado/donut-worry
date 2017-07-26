class ReviewMailer < ApplicationMailer
  default from: 'notifications@donut-worry.com'

  def review_email(user)
    @user = user
    @url = 'http://donut-worry.com/bakeries'

    mail(
      to: @user.email,
      subject: "Someone voted on your review!"
    )
  end
end
