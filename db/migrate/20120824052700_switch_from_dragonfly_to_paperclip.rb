class SwitchFromDragonflyToPaperclip < ActiveRecord::Migration
  def up
    remove_column :proofs, :proof_pdf_uid
    add_attachment :proofs, :pdf
  end

  def down
  end
end
