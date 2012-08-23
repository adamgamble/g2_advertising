class CreateNotificationEvents < ActiveRecord::Migration
  def change
    create_table :notification_events do |t|
      t.integer :notification_preference_id
      t.string :message

      t.timestamps
    end
  end
end
