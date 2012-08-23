class NotificationEvent < ActiveRecord::Base
  attr_accessible :message, :notification_preference_id, :status
end
