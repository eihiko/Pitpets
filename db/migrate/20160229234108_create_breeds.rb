class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :image_url
      t.integer :max_health
      t.integer :strength
      t.integer :dexterity
      t.integer :defense
      t.float :hunger_rate
    end
  end
end
