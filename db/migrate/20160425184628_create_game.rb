class CreateGame < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :guid, null: false, unique: true
      t.string :name, null: false, unique: true
      t.string :image_url
      t.float :rate
      t.datetime :recalculated
    end
  end
end
