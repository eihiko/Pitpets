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
		user.purchase params[:item], 20

		redirect_to "/shops/" + params[:id], notice: "Item purchased!"
	end

end
