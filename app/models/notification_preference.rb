class NotificationPreference < ActiveRecord::Base
  attr_accessible :email_address, :phone_number, :type, :user_id

  belongs_to :user

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
  end

  def notify_by_sms message
    @client = Twilio::REST::Client.new ENV["twilio_account_sid"], ENV["twilio_auth_token"]
    @client.account.sms.messages.create(
      :from => ENV["twilio_phone_number"],
      :to => self.phone_number,
      :body => message
    )
  end

end
