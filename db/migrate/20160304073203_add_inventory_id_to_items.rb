class AddInventoryIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :inventory_id, :integer
  end
end
