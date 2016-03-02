class AddItemForeignKeys < ActiveRecord::Migration
  def change
	add_column :item_type_effects, :item_type_id, :integer
	add_column :item_type_effects, :effect_type_id, :integer
	add_column :items, :item_type_id, :integer
	add_column :item_effects, :item_id, :integer
	add_column :item_effects, :effect_type_id, :integer
  end
end
