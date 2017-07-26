class ReviewMailer < ApplicationMailer
  default from: 'notifications@donut-worry.com'

  def new_review(user)
    @user = user
    @url = 'http://donut-worry.com/bakeries'

    mail(
      to: @user.email,
      subject: "Someone voted on your review!"
    )
  end
end
