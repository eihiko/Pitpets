class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :require_login

  private

  def require_login
    if session[:user_id]
      @current_user = User.find session[:user_id]
      return true
    else
      redirect_to controller: "/users", action: "new"
      return false
    end
  end

  def require_logout
    if session[:user_id]
      @current_user = User.find session[:user_id]
      redirect_to controller: "/sessions", action: "home"
      return false
    else
      return true
    end
  end
  
end
