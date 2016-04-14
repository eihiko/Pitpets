class AddHungerRateToPet < ActiveRecord::Migration
  def change
    add_column :pets, :hunger_rate, :float
  end
end
