class Shops::NpcShopsController < ApplicationController

	def show
		@shop = Shop.find(params[:id])

		@shop_inventory = Array(ShopInventory.where("sid = " + @shop.id.to_s))
		@shop_items = []
		@shop_inventory.each do |t|
			#Do a lookup to get the item, add it into shop_items
		end
	end

	def new
	end

	def create
		npc_shop = NpcShop.new(location: params[:location], shop_name: params[:shop_name])
		npc_shop.save

      	redirect_to "/shops/" + npc_shop.id.to_s, notice: "Shop created!"
	end

end
