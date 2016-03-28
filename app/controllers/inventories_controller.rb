class InventoriesController < ApplicationController
  
  def show
    @inventory = Inventory.find(params[:id])
  end

end
