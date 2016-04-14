class ItemEffect < ActiveRecord::Base

	belongs_to :effect_type

  def apply pet
    puts "WOOH"
    send(effect_type.name.underscore.to_sym, pet)
  end

	def self.food(item_id, effect_id, pet_id)
		food = Item.find(item_id)
		pet = Pet.find(pet_id)
		effect = ItemEffect.find(effect_id)
		pet.eat(effect.modifier1)
		pet.save!
	end

  def food pet
    puts "Feeding #{pet.name} for #{modifier1}"
    pet.eat modifier1
  end

  def heal pet
    puts "Healing #{pet.name} for #{modifier1}"
    pet.health += modifier1
  end

  def burn pet
    puts "Burning #{pet.name} for #{modifier1}"
    pet.health -= modifier1
  end

  def freeze pet
    puts "Freezing #{pet.name} for #{modifier1}"
    pet.health -= modifier1
  end

  def poison pet
    puts "Poisoning #{pet.name} for #{modifier1}"
    pet.health -= modifier1
  end

end
