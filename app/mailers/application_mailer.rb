class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@gmail.com"
  layout 'mailer'
end
