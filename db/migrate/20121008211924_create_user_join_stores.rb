class CreateUserJoinStores < ActiveRecord::Migration
  def change
    create_table :user_join_stores do |t|
      t.integer :user_id
      t.integer :store_id

      t.timestamps
    end
  end
end
