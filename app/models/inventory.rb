class Inventory < ActiveRecord::Base
  belongs_to :owner_type

  def items
  	Array.new(Item.where(inventory_id: self.id))
  end

  def find_item (item_id)
  	_items = self.items

  	_items.each do |i|
  		if i.id == item_id
  			return i
  		end
  	end
  end

  def add (item_id)
	item = Item.find(item_id)
  	item.inventory_id = self.id
  	item.save
  end
end
