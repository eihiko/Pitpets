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
  	_request = TradeRequest.find(params[:request])

  	if _request.get_from_user == @current_user
  		_request.from_user_agrees = true
  	else
  		_request.to_user_agrees = true
  	end

  	_request.save

  	if _request.from_user_agrees and _request.to_user_agrees
  		_request.trade
  		_request.destroy
  		redirect_to '/trading/requests', notice: "Trade complete!"
  	else
  		redirect_to '/trading/requests', notice: "Accepted request!"
  	end

  end

  def reject
  	_request = TradeRequest.find(params[:request])
  	_request.destroy

  	redirect_to '/trading/requests', notice: "Rejected request!"
  end

  def item_selection
  	@request = params[:request]
  	@items = @current_user.inventory.items
  end

  def select
  	_item = params[:item]
  	_request = TradeRequest.find(params[:request])
  	_request.item_to_user = _item
  	_request.to_user_agrees = true
  	_request.save

  	redirect_to '/trading/requests', notice: "Added item to request!"
  end

end
