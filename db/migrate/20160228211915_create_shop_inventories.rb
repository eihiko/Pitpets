class CreateShopInventories < ActiveRecord::Migration
  def change
    create_table :shop_inventories do |t|
      t.integer :sid
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
