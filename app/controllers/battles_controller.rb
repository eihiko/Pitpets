class BattlesController < ApplicationController
  
  def index
    @battles = @current_user.battles
  end

  def with
    @challenger = @current_user
    @opponent = User.find_by_username(params[:username])
    unless @opponent && @challenger
      render text: "User #{params[:username]} not found!", status: :not_found
    else
      @battle = @current_user.battles.where(finished: false).first
    end
  end

  def challenge
    @challenger = @current_user
    @opponent = User.find(params[:id])
    unless @opponent && @challenger
      render nothing: true, status: :not_found
    end
    b= Battle.create!;
    Contender.create!(battle_id: b.id, user_id: @challenger.id, challenger: true)
    Contender.create!(battle_id: b.id, user_id: @opponent.id)
    redirect_to controller: "battles", action: "show", id: b.id
  end

  def show
    @battle = @current_user.battles.find(params[:id])
    unless @battle
      render text: "Battle #{params[:id]} not found!", status: :not_found
    end
    if @current_user == @battle.challenger
      render "challenger"
    else
      render "opponent"
    end
  end

  def accept
    @battle = @current_user.battles.find(params[:id])
    if @battle.accepted.nil?
      @battle.accepted = true
      @battle.started = true
      @battle.save!
    end
    redirect_to controller: "battles", action: "show", id: @battle.id
  end

  def decline
    @battle = @current_user.battles.find(params[:id])
    if @battle.accepted.nil?
      @battle.accepted = false
      @battle.finished = true
      @battle.save!
    end
    redirect_to controller: "battles", action: "index"
  end



end

