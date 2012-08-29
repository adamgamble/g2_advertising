class AddLogoToUser < ActiveRecord::Migration
  def change
    add_attachment :users, :logo
    add_column :users, :name, :string
  end
end
