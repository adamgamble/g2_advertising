class UserMailer < ActionMailer::Base
  default from: "ads@g2advertising.com"

  def notify_of_proof(email)
    mail(:to => email, :subject => "New proof available!")
  end
end
