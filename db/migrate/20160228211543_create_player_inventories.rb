class CreatePlayerInventories < ActiveRecord::Migration
  def change
    create_table :player_inventories do |t|
      t.integer :pid
      t.integer :item_id

      t.timestamps null: false
    end
  end
end
