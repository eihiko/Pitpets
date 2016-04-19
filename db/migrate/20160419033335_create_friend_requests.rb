class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.int, :to_user
      t.int :from_user

      t.timestamps null: false
    end
  end
end
