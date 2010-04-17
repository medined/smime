require 'rubygems'
require 'action_mailer'
require 'smtp_tls'
require 'uuid'

class AnnounceMailer < ActionMailer::Base
  def hack_night_message(recipient)
    from 'SES Testing'
    recipients recipient
    subject 'SES Secure Message 2010 Apr 12'
    attachment :body => File.read("my-message.txt"), :filename => 'secure_message'
    body "This email looks correct to me for the initial message that gets signed. Do you agree?"
  end
#  def hack_night_message(recipient)
#    from 'SES Testing'
#    recipients recipient
#    subject 'SES Secure Message'
#    content_type "multipart/alternative"
#    headers 'X-SES-Message-ID' => UUID.new.generate, 'Disposition-Notification-To' => 'ses.testaccount2@yahoo.com'
#    part :content_type => "application/pkcs7-mime; smime-type=enveloped-data; name=smime.p7m", :body => File.read("encrypted-signed-message")
#    body "Secure Email Test"
#  end
end

#uuid = UUID.new.generate
#uuid.generate
#puts AnnounceMailer.create_hack_night_message( 'david.medinets@gmail.com' )

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :user_name => 'david.medinets@gmail.com',
  :password => ''
}

#AnnounceMailer.deliver_hack_night_message( 'ses.testaccount@yahoo.com, ses.testaccount2@yahoo.com, david.medinets@gmail.com, bjshur@yahoo.com, aheifetz@exaltllc.com' )
AnnounceMailer.deliver_hack_night_message( 'david.medinets@gmail.com, aheifetz@exaltllc.com' )
