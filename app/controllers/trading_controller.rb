class TradingController < ApplicationController
  def trade
  	@inventory = Inventory.find(params[:inventory])
  	@item = @inventory.find_item params[:item]

  	@friends = @current_user.friends
  end

  def requests
  end

  def send_request
  end

  def accept
  end

  def reject
  end
end
