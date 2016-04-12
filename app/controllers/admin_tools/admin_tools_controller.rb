class AdminTools::AdminToolsController < ApplicationController
  
  def index
    
  end

  def create_pet

  end

  def new_pet

  end

  def change_pet

  end

  def create_breed
    breed = Breed.new(name: params[:breed_name],max_health: params[:max_health],strength: params[:strength], dexterity: params[:dexterity], defense: params[:defense], hunger_rate: params[:hunger_rate])
    breed.save!
    redirect_to controller: "/breeds", action: :show, id: breed.id
  end

  def new_breed
    
  end

  def change_breed

  end

  def create_item_type
    item_type = ItemType.new(name: params[:item_type_name], durability: params[:durability])
    item_type.save!
    redirect_to controller: "/item_types", action: :show, id: item_type.id
  end

  def new_item_type

  end

  def change_item_type

  end

  def create_item

  end

  def new_item

  end

  def change_item

  end

  def create_shop

  end

  def new_shop

  end

  def change_shop

  end

  def change_user_stuff

  end

end
