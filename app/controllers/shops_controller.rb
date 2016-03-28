class ShopsController < ApplicationController

	def show
		@shop = Shop.find(params[:id])
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
		if(user.charge 20)
			item = Item.find(params[:item])
			new_item = item.new_from_item(item)
			new_item.save!
			user.inventory.add(new_item.id)
			redirect_to "/shops/" + params[:id], notice: "Item purchased!"
		end
	end

end
