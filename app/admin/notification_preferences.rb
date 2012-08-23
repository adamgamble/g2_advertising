ActiveAdmin.register NotificationPreference do
  filter :type
  filter :user
  index do
    column :type
    column :phone_number
    column :email_address
    column "User", :sortable => :user_id do |notification_preference|
      link_to notification_preference.user.email, admin_user_path(notification_preference.user)
    end
    default_actions
  end

  form do |f|
    f.inputs "" do
      f.input :type
      f.input :phone_number
      f.input :email_address
      f.input :user
    end
    f.buttons
  end
end
