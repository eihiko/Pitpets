class AddImageUrlToItemTypes < ActiveRecord::Migration
  def change
	add_column :item_types, :image_url, :string
  end
end
