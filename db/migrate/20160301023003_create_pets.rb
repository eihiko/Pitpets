class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.references :breed
      t.string :name
      t.integer :max_health
      t.integer :health
      t.integer :hunger
      t.integer :strength
      t.integer :dexterity
      t.integer :defense
    end
  end
end
