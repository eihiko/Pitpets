class FriendsController < ApplicationController
  
  def find
  	_friends = @current_user.friends
	_requests = FriendRequest.where(from_user: @current_user)
	_users = []
  	if params[:search]
  		_field = params[:search]
  		_users = User.where('username like ?', "%" + _field + "%").to_a
  	else 
  		_users = User.all.to_a
  	end	

	@users = eliminate_friends_and_requests _users, _friends, _requests

  end

  def eliminate_friends_and_requests (users, friends, requests)
  	friends.each do |f|
  		users.delete_if {|u| u == f}
  	end

  	requests.each do |r|
  		users.delete_if {|u| u.id == r.to_user}
  	end

	users
  end

  def send_request
  	current_user = params[:current_user]
  	target_user = params[:target_user]
  	_request = FriendRequest.find_by(to_user: current_user, from_user: target_user)

  	if _request
  		Friend.create(user_1: _request.to_user, user_2: _request.from_user)
  		_request.destroy
  		redirect_to "/friends/find", notice: "Friend Added!"
  	else
	  	FriendRequest.create(to_user: target_user, from_user:current_user)
	  	redirect_to "/friends/find", notice: "Request Sent!"
  	end  	
  end

  def review
  	@requests = FriendRequest.where(to_user: @current_user)
  end

  def accept
  	request = FriendRequest.find(params[:request])

  	Friend.create(user_1: request.to_user, user_2: request.from_user)
  	request.destroy

  	redirect_to :back, notice: "Friend Added!"
  end

  def reject
  	request = FriendRequest.find(params[:request])
  	request.destroy

  	redirect_to :back, notice: "Friendship Denied! *gasp*"
  end

  def list
  	@friends = @current_user.friends
  end

end
