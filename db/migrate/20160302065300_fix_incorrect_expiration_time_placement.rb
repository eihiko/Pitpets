class FixIncorrectExpirationTimePlacement < ActiveRecord::Migration
  def change
	remove_column :item_type_effects, :expires
	add_column :item_types, :expires, :datetime
  end
end
