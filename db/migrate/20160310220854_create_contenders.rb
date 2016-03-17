class CreateContenders < ActiveRecord::Migration
  def change
    create_table :contenders do |t|
      t.references :battle
      t.references :user
      t.boolean :challenger, default: false
    end
  end
end
