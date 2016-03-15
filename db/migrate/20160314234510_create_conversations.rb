class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.references :user_a, :user_b, foreign_key: true
    end
  end
end
