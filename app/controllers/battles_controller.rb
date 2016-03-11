class BattlesController < ApplicationController
  
  def index
    @challenger = @current_user
    @opponent = User.find_by_username(params[:username])
    unless @opponent && @challenger
      render text: "User #{params[:username]} not found!", status: :not_found
    else
      @battle = @current_user.battles.first
    end
  end

  def challenge
    @challenger = @current_user
    @opponent = User.find(params[:id])
    unless @opponent && @challenger
      render nothing: true, status: :not_found
    end
    b= Battle.create!;
    Contender.create!(battle_id: b.id, user_id: @challenger.id)
    Contender.create!(battle_id: b.id, user_id: @opponent.id)
    redirect_to controller: "battles", action: "show", id: b.id
  end

  def show
    @battle = @current_user.battles.find(params[:id])
    unless @battle
      render text: "Battle #{params[:id]} not found!", status: :not_found
    end
  end

end

