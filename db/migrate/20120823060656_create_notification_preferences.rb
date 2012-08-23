class CreateNotificationPreferences < ActiveRecord::Migration
  def change
    create_table :notification_preferences do |t|
      t.integer :user_id
      t.string :phone_number
      t.string :type
      t.string :email_address

      t.timestamps
    end
  end
end
