class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.integer :shopkeeper_id
      t.string :location
      t.integer :inventory_id

      t.timestamps null: false
    end
  end
end
