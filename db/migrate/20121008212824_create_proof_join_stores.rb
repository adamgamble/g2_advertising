class CreateProofJoinStores < ActiveRecord::Migration
  def change
    create_table :proof_join_stores do |t|
      t.integer :proof_id
      t.integer :store_id

      t.timestamps
    end
  end
end
