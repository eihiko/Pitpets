class FriendsController < ApplicationController
  def find
  	@users = User.all
  end

  def send_request
  	current_user = params[:current_user]
  	target_user = params[:target_user]

  	FriendRequest.create(to_user: target_user, from_user:current_user)

  	redirect_to "/friends/find", notice: "Request Sent!"
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
  	@friends = []

  	# Get all friends where current user is user 1
  	temp_friends = Friend.where(user_1: @current_user).all
  	temp_friends.each do |t|
  		@friends << User.find(t.user_2)
	end

	# Get all friends where current user is user 2
	temp_friends = Friend.where(user_2: @current_user).all
	temp_friends.each do |t|
  		@friends << User.find(t.user_1)
	end

  end
end
