class ItemEffect < ActiveRecord::Base

	belongs_to :effect_type

	def self.food(item_id, pet_id)
		food = Item.find(item_id)
		pet = Pet.find(pet_id)
		effect = food.get_effect("Food")
		pet.eat(effect.modifier1)
		pet.save!
	end

end
