class AddProofDeadlineToProofs < ActiveRecord::Migration
  def change
    add_column :proofs, :proof_deadline, :datetime
  end
end
