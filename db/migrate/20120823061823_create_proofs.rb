class CreateProofs < ActiveRecord::Migration
  def change
    create_table :proofs do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
