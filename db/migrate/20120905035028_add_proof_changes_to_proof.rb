class AddProofChangesToProof < ActiveRecord::Migration
  def change
    add_column :proofs, :proof_changes, :text
  end
end
