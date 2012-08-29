class AddStateToProof < ActiveRecord::Migration
  def change
    add_column :proofs, :state, :string
  end
end
