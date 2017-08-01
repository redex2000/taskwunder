require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "profile" do
    let(:user) { create(:user) }
    let(:mail) { UserMailer.profile(user, ProfilePdfGenerator.new.generate(user)) }

    it "send mail to right subject" do
      expect(mail.subject).to eq("User's profile")
    end

    it 'send mail to correct receiver' do
      expect(mail.to).to eq(["development@taskwunder.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Sending you user's profile")
    end
  end

end
