class ProfilePdfGenerator
  def initialize
    @pdf = Prawn::Document.new
  end

  def generate(user)
    @pdf.text "User's profile", size: 14, align: :center
    @pdf.image Rails.root.join('public', user.avatar.thumb.url[1..-1]).to_s if user.avatar.present?
    @pdf.text user.full_name
    @pdf.text user.email
    filename = Rails.root.join 'tmp/profile.pdf'
    @pdf.render_file filename
    filename
  end
end