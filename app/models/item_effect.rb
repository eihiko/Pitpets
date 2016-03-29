class ItemEffect < ActiveRecord::Base

	belongs_to :effect_type

	def self.food(item_id, effect_id, pet_id)
		food = Item.find(item_id)
		pet = Pet.find(pet_id)
		effect = ItemEffect.find(effect_id)
		pet.eat(effect.modifier1)
		pet.save!
	end

end
