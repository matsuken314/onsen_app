class WelcomeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.send_change_pass.subject
  #
  def send_change_pass(email, name)
    @greeting = "Hi"
    @name = name
    mail to:  email, subject: 'Registration Complete! Thanks for Joining!'
  end
end
