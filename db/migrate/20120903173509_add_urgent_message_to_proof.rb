class AddUrgentMessageToProof < ActiveRecord::Migration
  def change
    add_column :proofs, :urgent_message, :text
  end
end
