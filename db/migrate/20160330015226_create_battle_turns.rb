class CreateBattleTurns < ActiveRecord::Migration
  def change
    create_table :battle_turns do |t|
      t.references :battle
      t.references :contender
      t.references :offensive_item
      t.references :defensive_item
      t.boolean :completed, default: false
    end
  end
end
