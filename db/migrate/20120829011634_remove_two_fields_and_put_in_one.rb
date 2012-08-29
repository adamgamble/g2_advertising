class RemoveTwoFieldsAndPutInOne < ActiveRecord::Migration
  def change
    remove_column :notification_preferences, :phone_number
    remove_column :notification_preferences, :email_address
    add_column :notification_preferences, :phone_email, :string
  end
end
