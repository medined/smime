class Notifier < ActionMailer::Base
  def smime_notification(recipient)
     recipients recipient.email_address_with_name
     bcc        ["david.medinets+bcc@gmail.com"]
     from       "Secure Exchange Solutions"
     subject    "SMIME"
     body       :account => recipient
   end
end
