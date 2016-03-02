class BattlesController < ApplicationController
  
  def index
    @challenger = @current_user
    @opponent = User.find_by_username(params[:username])
    unless @opponent && @challenger
      render :not_found
    end
    @battle = @current_user.battles.find_by_opponent(@opponent.id).first
  end

  def challenge
    @challenger = @current_user
    @opponent = User.find(params[:id])
    unless @opponent && @challenger
      render :not_found
    end
    b= Battle.create!(challenger: @challenger.id, opponent: @opponent.id)
    redirect_to controller: "battles", action: "show", id: b.id
  end

  def show
  end

end
