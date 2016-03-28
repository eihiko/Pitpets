class Item < ActiveRecord::Base

	belongs_to :item_type
	has_many :item_effects

	def type
		ItemType.find(self.item_type_id)
	end

	def new_from_item_type(type_id)
		type = ItemType.find(type_id)
		new_item = Item.new(item_type_id: type.id, durability: type.durability, expires: type.expires)		
		ItemEffect.find_by_item_type_id(type_id).each do |effect|
			ItemEffect.new(item_id: new_item.id, effect_type_id: effect.effect_type_id, modifier1: effect.modifier1, 				modifier2: effect.modifier1, modifier3: effect.modifier3, time_modifier: effect.time_modifier, 				text_modifier: effect.text_modifier)
		end
		return new_item		
	end

	def new_from_item(item_id)
		item = Item.find(item_id)
		new_item = Item.new(item_type_id: item.item_type_id, durability: item.durability, expires: 				item.expires)		
		ItemEffect.find_by_item(item_id).each do |effect|
			ItemEffect.new(item_id: new_item.id, effect_type_id: effect.effect_type_id, modifier1: effect.modifier1, 				modifier2: effect.modifier1, modifier3: effect.modifier3, time_modifier: effect.time_modifier, 				text_modifier: effect.text_modifier)
		end
		return new_item
	end

	def duplicate
		new_item = new_from_item(self.id)
		new_item.save!
		return new_item
	end

end
