class BattlesController < ApplicationController
  
  DECISION_KEEP = 0
  DECISION_KILL = 1
  DECISION_RELEASE = 2

  def index
    @battles = @current_user.battles
  end

  def with
    @challenger = @current_user
    @opponent = User.find_by_username(params[:username])
    unless @opponent && @challenger
      render text: "User #{params[:username]} not found!", status: :not_found
    else
      @battle = nil
      @current_user.battles.where(finished: false).each do |battle|
        @battle = battle if battle.contender? @opponent
      end
      unless @battle.nil?
        redirect_to controller: "/battles", action: "show", id: @battle.id
      end
    end
  end

  def npc
    tallgrass = User.find_by_username("tallgrass")
    p = Pet.create(
      name: "Tick",
      breed_id: Breed.find_by_name("IncrediblyLargeTickWithLymeDisease").id,
      owner_id: tallgrass.id,
    )
    b = Battle.create!
    Contender.create!(battle_id: b.id, user_id: tallgrass.id, pet_id: p.id, challenger: true)
    Contender.create(battle_id: b.id, user_id: @current_user.id, pet_id: @current_user.pets.first.id)
    b.accepted = true
    b.started = true
    b.save!
    redirect_to controller: "battles", action: "show", id: b.id
  end

  def challenge
    @challenger = @current_user
    @opponent = User.find(params[:opponent])
    unless @opponent && @challenger
      render nothing: true, status: :not_found
    end
    b = Battle.create!
    pet = @current_user.pets.find(params[:pet])
    Contender.create!(battle_id: b.id, user_id: @challenger.id, 
                      pet_id: pet.id, challenger: true)
    Contender.create!(battle_id: b.id, user_id: @opponent.id, 
                      pet_id: nil)
    redirect_to controller: "battles", action: "show", id: b.id
  end

  def capture
    @battle = @current_user.battles.find(params[:id])
    @battle.contenders.each do |contender|
      if(contender.user == @current_user)
        @me = contender.user
        @my_pet = contender.pet
      else
        @them = contender.user
        @their_pet = contender.pet
      end
    end
    if params[:decision].to_i == DECISION_KEEP
      Status.transaction do
        @their_pet.owner_id = @me.id
        @their_pet.remove_status("Captured")
        @their_pet.save!
        status_type = StatusType.find_by_name("Captured")
        @their_pet.statuses.find_by_status_type_id(status_type.id).destroy
      end
    elsif params[:decision].to_i == DECISION_KILL
      Battle.transaction do
        @their_pet.remove_status("Captured")
        @their_pet.kill!
      end
    elsif params[:decision].to_i == DECISION_RELEASE
      @their_pet.remove_status("Captured")
    end
    @battle.finished = true
    if @battle.challenger.user == @me
      @battle.won = true
    else
      @battle.won = false
    end
    @battle.save!
    redirect_to controller: "/battles", action: "show", id: @battle.id
  end

  def turn
    @battle = @current_user.battles.find(params[:id])
    @battle.contenders.each do |contender|
      if(contender.user == @current_user)
        @me = contender
        @my_pet = contender.pet
      else
        @them = contender
        @their_pet = contender.pet
      end
    end
    npc_turn(@battle) if @them.user.username == "tallgrass"
    turn = @battle.battle_turns.where(completed: false).first;
    if turn.nil?
      @battle.battle_turns.create!(
        contender_id: @me.id,
        offensive_item_id: params[:offensive],
        defensive_item_id: params[:defensive],
        completed: false
      )
    elsif turn.contender.id == @me.id
      flash.alert = "You already did your turn bro!"
    else
      my_turn = @battle.battle_turns.new(
        contender_id: @me.id,
        offensive_item_id: params[:offensive],
        defensive_item_id: params[:defensive],
        completed: false
      )
      my_turn.offensive_item.apply @their_pet
      turn.defensive_item.apply @their_pet
      turn.offensive_item.apply @my_pet
      my_turn.defensive_item.apply @my_pet
      my_turn.completed = true
      turn.completed = true
      BattleTurn.transaction do
        @their_pet.save!
        @my_pet.save!
        my_turn.save!
        turn.save!
      end
      my_off_item = my_turn.offensive_item.item_type.name
      my_def_item = my_turn.defensive_item.item_type.name
      their_off_item = turn.offensive_item.item_type.name
      their_def_item = turn.defensive_item.item_type.name
      flash.notice = ""
      flash.notice << "#{@my_pet.name} used #{my_off_item} on #{@their_pet.name}. "
      flash.notice << "#{@their_pet.name} used #{their_def_item} on themself. "
      flash.notice << "#{@their_pet.name} used #{their_off_item} on #{@my_pet.name}. "
      flash.notice << "#{@my_pet.name} used #{my_def_item} on themself."
      if @battle.challenger.pet.dead?
        @battle.won = false
        @battle.finished = true
        @battle.save!
      elsif @battle.opponent.pet.dead?
        @battle.won = true
        @battle.finished = true
        @battle.save!
      end
    end

    redirect_to controller: :battles, action: :show, id: params[:id]
  end

  def show
    @battle = @current_user.battles.find(params[:id])
    unless @battle
      render text: "Battle #{params[:id]} not found!", status: :not_found
    end
    if @current_user == @battle.challenger.user
      render "challenger"
    else
      render "opponent"
    end
  end

  def accept
    @battle = @current_user.battles.find(params[:id])
    if @battle.accepted.nil?
      Battle.transaction do
        @opponent = @battle.opponent 
        @opponent.pet = @current_user.pets.find(params[:pet])
        @battle.accepted = true
        @battle.started = true
        @battle.save!
        @opponent.save!
      end
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

  private
  
  def npc_turn battle
    tallgrass = nil
    battle.contenders.each do |c|
      tallgrass = c if c.user.username == "tallgrass"
    end
    offensive = tallgrass.user.inventory.items.first
    defensive = tallgrass.user.inventory.items.last
    battle.battle_turns.create!(
      contender_id: tallgrass.id,
      offensive_item_id: offensive.id,
      defensive_item_id: defensive.id,
      completed: false
    )
  end

end

