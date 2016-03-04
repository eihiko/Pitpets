class Inventory < ActiveRecord::Base
  belongs_to :owner_type

  def items
  	Array.new(Item.where(inventory_id: self.id))
  end

  def add_item (item_id)
  	item = Item.find(item_id).dup
  	item.inventory_id = self.id
  	item.save
  end

end
