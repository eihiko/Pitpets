class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_1
      t.integer :user_2

      t.timestamps null: false
    end
  end
end
