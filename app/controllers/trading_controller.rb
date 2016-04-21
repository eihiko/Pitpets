class TradingController < ApplicationController
  def trade
  	@inventory = Inventory.find(params[:inventory])
  	@item = @inventory.find_item params[:item]

  	@friends = @current_user.friends
  end

  def requests
  	@requests_pending 
  end

  def send_request
  	@item = params[:item]
  	@to_user = params[:to_user]

  	TradeRequest.create(from_user: @current_user, to_user: @to_user, item_from_user: @item)
  	redirect_to '/trading/requests', notice: "Request Sent!"
  end

  def accept
  end

  def reject
  end
end
