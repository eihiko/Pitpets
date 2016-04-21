class CreateTradeRequests < ActiveRecord::Migration
  def change
    create_table :trade_requests do |t|
      t.integer :to_user
      t.integer :from_user
      t.integer :item_to_user
      t.integer :item_from_user

      t.timestamps null: false
    end
  end
end
