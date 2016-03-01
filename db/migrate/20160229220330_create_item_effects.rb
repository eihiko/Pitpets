class CreateItemEffects < ActiveRecord::Migration
  def change
    create_table :item_effects do |t|
	t.float :modifier1
	t.float :modifier2
	t.float :modifier3
	t.time :time_modifier
	t.string :text_modifier
    end
    add_foreign_key :item_effects, :items
    add_foreign_key :item_effects, :effect_types
  end
end
