class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
		t.integer :durability
		t.datetime :expires
		t.timestamps
	 end
	 add_foreign_key :items, :item_types
	 #TODO: foreign key - inventory id
  end
end
