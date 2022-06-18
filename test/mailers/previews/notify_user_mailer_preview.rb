# Preview all emails at http://localhost:3000/rails/mailers/notify_user_mailer
class NotifyUserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notify_user_mailer/notify
  def notify
    NotifyUserMailer.notify
  end

end
