class Shop < ActiveRecord::Base
  belongs_to :shopkeeper
  after_create :create_inventory

  def inventory
  	Inventory.where(owner_id: self.id, owner_type: OwnerType.find_by(name: "npc_shop")).first
  end

  def create_inventory
  	Inventory.create(owner_id: self.id, owner_type: OwnerType.find_by(name: "npc_shop"))
  end

end
