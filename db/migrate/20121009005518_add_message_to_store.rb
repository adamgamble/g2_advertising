class AddMessageToStore < ActiveRecord::Migration
  def change
    add_column :stores, :message, :text
  end
end
