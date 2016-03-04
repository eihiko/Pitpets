class ItemTypesController < ApplicationController

	def show
		@item = ItemType.find(params[:id])
		if @item.nil?
			render :not_found
		end
	end	
end
