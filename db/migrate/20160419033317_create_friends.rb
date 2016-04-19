class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.int, :user_1
      t.int :user_2

      t.timestamps null: false
    end
  end
end
