class AlertMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.alert_mailer.send_alert.subject
  #
  def send_alert(email_alert)
    @body = email_alert.all_params.body
    settings = Setting.first


    mail to: settings.alert_email, subject: email_alert.subject, from: ENV["FROM_EMAIL"]
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.alert_mailer.send_page.subject
  #
  def send_page(email_alert)
    @body = email_alert.all_params.body
    settings = Setting.first


    mail to: settings.pager_email, subject: email_alert.subject, from: ENV["FROM_EMAIL"]
  end
end
