class Api::GamesController < ApplicationController

  skip_before_action :require_login
  skip_before_action :verify_authenticity_token
  
  def quote
    user = User.find_by_guid(params[:user_guid])
    game = Game.find_by_guid(params[:game_guid])
    game.quote!
    render json: game.to_json(only: [:rate])
  end

  def submit_score
    user = User.find_by_guid(params[:user_guid])
    game = Game.find_by_guid(params[:game_guid])
    if user.nil? || game.nil?
      render nothing: true, status: :not_found
    end
    score = params[:score].to_f
    time = params[:time].to_i
    rate = game.quote!
    Game.transaction do
      user.pitpoints += (score * rate).to_i
      user.save!
      game.game_scores.create!(
        user_id: user.id,
        score: params[:score].to_f,
        time: params[:time].to_i
      )
    end
  end

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

  # This method doesn't work yet because I know negative nothing about rails ~Adam
  # This should let the user buy something from the shop in exchange for dollaz
  def buy
    user = User.find_by_guid(params[:id])
    if user
      user.dollaz -= params[:price].to_i
      PlayerInventory.create(pid: user.id, item_id: params[:item].id)
      user.save!
      render nothing:true, notice: "Item bought!"
    else
      render nothing:true, notice: "Error: unable to purchase item"
    end
  end

end
