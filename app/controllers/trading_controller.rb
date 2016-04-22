class TradingController < ApplicationController
  def trade
  	@inventory = Inventory.find(params[:inventory])
  	@item = params[:item]

  	@friends = @current_user.friends
  end

  def requests
  	@outgoing_requests = TradeRequest.where(from_user: @current_user, item_to_user: nil).all
  	@incoming_requests = TradeRequest.where(to_user: @current_user, item_to_user: nil).all
  	@final_requests_from = TradeRequest.where(from_user: @current_user).where.not('item_to_user' => nil).all
  	@final_requests_to = TradeRequest.where(to_user: @current_user).where.not('item_to_user' => nil).all
  end

  def send_request
  	@item = params[:item]
  	@to_user = params[:to_user]
  	@from_user = params[:from_user]

  	TradeRequest.create(from_user: @from_user, to_user: @to_user, item_from_user: @item)
  	redirect_to '/trading/requests', notice: "Request Sent!"
  end

  def accept
  end

  def reject
  end

  def item_selection
  	@request = params[:request]
  	@items = @current_user.inventory.items
  end

  def select
  	_item = params[:item]
  	_request = TradeRequest.find(params[:request])
  	_request.item_to_user = _item
  	_request.save
  	
  	redirect_to '/trading/requests', notice: "Added item to request!"
  end

end
