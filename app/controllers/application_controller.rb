class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :require_login
  before_action :add_https

  protected

  def add_https
    puts request.original_url
    unless request.original_url[/\Ahttps:\/\//] || request.original_url[/\Ahttp:\/\//]
      puts "REDIRECTING TO HTTPS"
      redirect_to "https://#{request.original_url}"
    end
  end

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

  def redirect_back
    redirect_to request.referer || root_path
  end
  
end
