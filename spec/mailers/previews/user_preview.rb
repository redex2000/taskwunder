# Preview all emails at http://localhost:3000/rails/mailers/user
class UserPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user/profile
  def profile(user, filename)
    UserMailer.profile(user, filename)
  end

end
