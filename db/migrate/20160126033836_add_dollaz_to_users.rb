class AddDollazToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dollaz, :int, default: 0, null: false
  end
end
