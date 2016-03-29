class InventoriesController < ApplicationController
  
  def show
    @inventory = Inventory.find(params[:id])
  end

  def feed
	item = Item.find(params[:item_id])
	ItemEffect.food(item.id, params[:effect_id], params[:pet_id])
	item.destroy
	redirect_to controller: :inventories, action: :show
  end

  def user
	@inventory = @current_user.inventory
	render "show"
  end

end
