class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"
end

class ApplicationMailer < ActionMailer::Base
  default from:     "ととのい運営",
          bcc:      "totonoi2022@gmail.com"
  layout 'mailer'
end