class CreateEffectTypes < ActiveRecord::Migration
  def change
    create_table :effect_types do |t|
	t.string :name, null: false
    end
  end
end
