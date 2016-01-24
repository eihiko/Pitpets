class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:login, :login_attempt]
  before_action :require_logout, only: [:login, :login_attempt]

  def login
  end

  def home
  end

  def profile
  end

  def settings
  end

  def login_attempt
    user = User.try_login params[:username], params[:password]
    if user
      session[:user_id] = user.id
      redirect_to "/", notice: "Welcome back!"
    else
      redirect_to controller: "sessions", action: "login", alert: "User authentication failed."
    end
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
    redirect_to controller: "sessions", action: "login", notice: "Logout complete."
  end

end
