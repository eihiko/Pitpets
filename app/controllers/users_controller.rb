class UsersController < ApplicationController

  skip_before_action :require_login
  before_action :require_logout

  def new
  end

  def create
    inventory = PlayerInventory.new
    inventory.save

    user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    user.guid = SecureRandom.uuid
    user.save
    if user.valid?
      redirect_to "/", notice: "Your account has been created! Welcome to Pitpets!"
    else
      redirect_to "/users/new", alert: user.errors.messages
    end
  end

end
