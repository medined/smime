require 'rubygems'
require 'action_mailer'
require 'smtp_tls'

class AnnounceMailer < ActionMailer::Base

  def hack_night_message(recipient)
    from 'david.medinets@gmail.com'
    recipients recipient
    subject 'Signed and Encrypted Test'
    content_type    "multipart/alternative"
    attachment :content_type => "application/x-pkcs7-mime", :body => File.read("encrypted-signed-message")
    body ""
  end
end

#puts AnnounceMailer.create_hack_night_message( 'david.medinets@gmail.com' )

ActionMailer::Base.smtp_settings = {
  :address => 'smtp.gmail.com',
  :port => 587,
  :authentication => :plain,
  :user_name => 'david.medinets@gmail.com',
  :password => 'tpcjw6357'
}

AnnounceMailer.deliver_hack_night_message( 'ses.testaccount@yahoo.com, ses.testaccount2@yahoo.com, david.medinets@gmail.com, bjshur@yahoo.com, aheifetz@exaltllc.com' )