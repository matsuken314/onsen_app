require "test_helper"

class WelcomeMailerTest < ActionMailer::TestCase
  test "send_change_pass" do
    mail = WelcomeMailer.send_change_pass
    assert_equal "Send change pass", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
