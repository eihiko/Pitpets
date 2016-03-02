class AddDefaultInfoToItemTypeEffects < ActiveRecord::Migration
  def change
	add_column :item_type_effects, :modifier1, :float
	add_column :item_type_effects, :modifier2, :float
	add_column :item_type_effects, :modifier3, :float
	add_column :item_type_effects, :time_modifier, :time
	add_column :item_type_effects, :text_modifier, :string
  end
end
