class UserMailer < ApplicationMailer

  default from: Proc.new { User.admin.first.try(:email) || 'admin@profport.ru' },
          to: 'development@taskwunder.com'

  def profile(user, filename)
    @user = user
    attachments[filename.basename.to_s] = File.read filename.realpath.to_s
    mail subject: t('user_mailer.profile.subject', default: 'User\'s profile')
  end
end
