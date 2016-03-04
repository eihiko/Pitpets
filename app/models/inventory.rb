class Inventory < ActiveRecord::Base
  belongs_to :owner_type

  def items
  	Array.new(Item.where(inventory_id: self.id))
  end
end
