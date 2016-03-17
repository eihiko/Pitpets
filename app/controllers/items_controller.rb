class ItemsController < ApplicationController

	def show
		@item = Item.find(params[:id])
		if @item.nil?
			render :not_found
		end
	end	
end
