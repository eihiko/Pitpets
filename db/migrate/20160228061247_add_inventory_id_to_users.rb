class AddInventoryIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :inventory_id, :integer
  end
end
