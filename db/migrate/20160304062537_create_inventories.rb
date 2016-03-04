class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :owner_id
      t.references :owner_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
