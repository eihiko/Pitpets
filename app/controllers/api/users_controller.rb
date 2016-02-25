class Api::UsersController < ApplicationController

  skip_before_action :require_login
  skip_before_action :verify_authenticity_token
  
  def show
    user = User.find_by_guid(params[:id])
    render json: user.to_json(except: [:password_digest, :email])
  end

  def pay
    user = User.find_by_guid(params[:id])
    if user
      user.dollaz += params[:dollaz].to_i
      user.save!
      render nothing: true, status: :accepted
    else
      render nothing: true, status: :not_found
    end
  end

end
