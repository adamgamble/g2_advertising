class AddPdfToProof < ActiveRecord::Migration
  def change
    add_column :proofs, :proof_pdf_uid,  :string
  end
end
