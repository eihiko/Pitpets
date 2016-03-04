class ShopsController < ApplicationController

	def show
		@shop = Shop.find(params[:id])
		@shop.inventory.items
			#Do a lookup to get the item, add it into shop_items

	end

	def new
	end

	def create
		npc_shop = Shop.new(name: params[:shop_name])
		npc_shop.save

      	redirect_to "/shops/" + npc_shop.id.to_s, notice: "Shop created!"
	end

	def buy
		user = User.find(params[:user])
		Users.purchase
		redirect_to "/shops/" + params[:id], notice: "Item purchased!"
	end

end
