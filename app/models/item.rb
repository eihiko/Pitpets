class Item < ActiveRecord::Base

	belongs_to :item_type
	has_many :item_effects, dependent: :destroy

	def type
		ItemType.find(self.item_type_id)
	end

	def self.new_from_item_type(type_id)
		type = ItemType.find(type_id)
		new_item = Item.new(item_type_id: type.id, durability: type.durability, expires: type.expires)	
		new_item.save!
		type.item_type_effects.each do |effect|
			ItemEffect.new(item_id: new_item.id, effect_type_id: effect.effect_type_id, modifier1: effect.modifier1, 				modifier2: effect.modifier1, modifier3: effect.modifier3, time_modifier: effect.time_modifier, 				text_modifier: effect.text_modifier).save!
		end
		return new_item		
	end

	def self.new_from_item(item_id)
		item = Item.find(item_id)
		new_item = Item.new(item_type_id: item.item_type_id, durability: item.durability, expires: 				item.expires)
		new_item.save!		
		item.item_effects.each do |effect|
			ItemEffect.new(item_id: new_item.id, effect_type_id: effect.effect_type_id, modifier1: effect.modifier1, 				modifier2: effect.modifier2, modifier3: effect.modifier3, time_modifier: effect.time_modifier, 				text_modifier: effect.text_modifier).save!
		end
		return new_item
	end

	def duplicate
		new_item = new_from_item(self.id)
		new_item.save!
		return new_item
	end

	def get_effect(effect_name)
		self.item_effects.each do |effect|
			if (effect.effect_type.name == effect_name)
				return effect
			end
		end
	return nil
	end

end
