class InventoriesController < ApplicationController
  
  def show
    @inventory = Inventory.find(params[:id])
  end

  def feed
	item = Item.find(params[:item])
	ItemEffect.food(item.id, params[:pet_id])
	item.destroy
	redirect_to controller: :inventories, action: :show
  end

end
