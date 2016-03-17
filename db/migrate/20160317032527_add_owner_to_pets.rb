class AddOwnerToPets < ActiveRecord::Migration
  def change
    add_column :pets, :owner_id, :integer, index: true
  end
  add_foreign_key :pets, :users, primary_key: :owner_id
end
