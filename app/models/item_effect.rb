class ItemEffect < ActiveRecord::Base

	belongs_to :effect_type

  def apply pet
    send("fx_#{effect_type.name.underscore}".to_sym, pet)
  end

	def self.food(item_id, effect_id, pet_id)
		food = Item.find(item_id)
		pet = Pet.find(pet_id)
		effect = ItemEffect.find(effect_id)
		pet.eat(effect.modifier1)
		pet.save!
	end

  def fx_damage pet
    pet.health -= modifier1
  end

  def fx_food pet
    pet.eat modifier1
  end

  def fx_heal pet
    pet.health += modifier1
  end

  def fx_burn pet
    pet.health -= modifier1
  end

  def fx_freeze pet
    pet.health -= modifier1
  end

  def fx_poison pet
    pet.health -= modifier1
  end

  def fx_capture pet
    #If we ever switch to float chance %, we'll need to use a float random number generator
    r = Random.rand(100)
    if r < modifier1
      Status.transaction do 
        status_type = StatusType.find_by_name("Captured")
        pet.statuses.create!(status_type_id: status_type.id)
      end
    end
  end

end
