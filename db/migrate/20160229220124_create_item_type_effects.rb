class CreateItemTypeEffects < ActiveRecord::Migration
  def change
    create_table :item_type_effects do |t|
	t.datetime :expires
    end
    add_foreign_key :item_type_effects, :effect_types
  end
end
