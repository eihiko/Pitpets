class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :to_user
      t.integer :from_user

      t.timestamps null: false
    end
  end
end
