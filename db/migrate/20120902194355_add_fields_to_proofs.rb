class AddFieldsToProofs < ActiveRecord::Migration
  def change
    add_column :proofs, :in_home_date, :date
    add_column :proofs, :print_date, :date
  end
end
