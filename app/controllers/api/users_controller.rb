class Api::UsersController < ApplicationController

  skip_before_action :require_login
  
  def show
    user = User.find_by_guid(params[:id])
    render json: user.to_json(except: [:password_digest, :email])
  end

  def pay
    user = User.find_by_guid(params[:id])
    if user
      user.dollaz += params[:amount].to_i
      user.save!
      render nothing: true, status: :accepted
    else
      render nothing: true, status: :not_found
    end
  end

end
