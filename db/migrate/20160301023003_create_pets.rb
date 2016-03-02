class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :max_health
      t.integer :health
      t.integer :hunger
      t.integer :strength
      t.integer :dexterity
      t.integer :defense
    end
    add_foreign_key :pets, :breeds
  end
end
