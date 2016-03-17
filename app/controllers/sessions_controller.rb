class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:logout, :login, :login_attempt]
  before_action :require_logout, only: [:login, :login_attempt]

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
      redirect_to({controller: "/sessions", action: "home"}, notice: "Welcome back!")
    else
      redirect_to({controller: "/users", action: "new"}, alert: "User authentication failed.")
    end
  end

  def logout
    session[:user_id] = nil
    @current_user = nil
    redirect_to({controller: "/users", action: "new"}, notice: "Logout complete.")
  end

end
