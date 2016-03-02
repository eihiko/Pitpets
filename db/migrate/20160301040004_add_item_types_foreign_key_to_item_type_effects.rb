class AddItemTypesForeignKeyToItemTypeEffects < ActiveRecord::Migration
  def change
	add_foreign_key :item_type_effects, :item_types
  end
end
