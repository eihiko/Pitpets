class Inventory < ActiveRecord::Base
  belongs_to :owner_type

  def items
  	Array.new(Item.where(inventory_id: self.id))
  end

  def add (item_id)
	item = Item.find(item_id)
  	item.inventory_id = self.id
  	item.save
  end
end
