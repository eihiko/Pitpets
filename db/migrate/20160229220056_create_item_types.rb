class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
	t.string :name
	t.integer :durability
    end
  end
end
