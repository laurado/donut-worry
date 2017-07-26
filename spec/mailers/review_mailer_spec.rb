require "rails_helper"

RSpec.describe ReviewMailer, type: :mailer do
  describe "send vote email" do
    let!(:jackie) do
      User.create(
        first_name: 'Jackie',
        last_name: 'Ma',
        password: 'JackieIsMyMom',
        profile_photo: "http://i.imgur.com/jluf593.jpg",
        email: 'JackAttack16@email.com'
      )
    end
    let(:mail) { ReviewMailer.review_email(jackie).deliver_now }

    it "renders the correct headers" do
      expect(mail.subject).to eq "Someone voted on your review!"
      expect(mail.to).to eq([jackie.email])
      expect(mail.from).to eq(["notifications@donut-worry.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to have_text("Someone voted on one of your reviews!")
    end
  end
end
