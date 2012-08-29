class NotificationPreference < ActiveRecord::Base
  attr_accessible :email_address, :phone_number, :type, :user_id, :phone_email

  belongs_to :user
  has_many :notification_events

  def notify! message
    case self.type
    when "EmailNotification"
      notify_by_email message
    when "SMSNotification"
      notify_by_sms message
    end
  end

  private
  def notify_by_email message
    UserMailer.notify_of_proof(self.phone_email).deliver
  end

  def notify_by_sms message
    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
    @client.account.sms.messages.create(
      :from => ENV["twilio_phone_number"],
      :to => self.phone_email,
      :body => message
    )
    NotificationEvent.create(:message => message)
  end

end
