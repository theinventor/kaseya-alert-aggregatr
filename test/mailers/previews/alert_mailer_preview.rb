# Preview all emails at http://localhost:3000/rails/mailers/alert_mailer
class AlertMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/alert_mailer/send_alert
  def send_alert
    AlertMailer.send_alert
  end

  # Preview this email at http://localhost:3000/rails/mailers/alert_mailer/send_page
  def send_page
    AlertMailer.send_page
  end

end
