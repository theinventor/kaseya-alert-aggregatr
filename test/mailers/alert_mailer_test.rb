require 'test_helper'

class AlertMailerTest < ActionMailer::TestCase
  test "send_alert" do
    mail = AlertMailer.send_alert
    assert_equal "Send alert", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "send_page" do
    mail = AlertMailer.send_page
    assert_equal "Send page", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
