class AddGuidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guid, :string, null: false, unique: true, default: "00000000-0000-0000-0000-000000000000"
  end
end
