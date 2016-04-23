class CreateFoodKitchenVisits < ActiveRecord::Migration
  def change
    create_table :food_kitchen_visits do |t|
	t.references :user
	t.timestamps
    end
  end
end
