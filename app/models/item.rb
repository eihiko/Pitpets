class Item < ActiveRecord::Base

	belongs_to :item_type
	has_many :item_effects

	def type
		ItemType.find(self.item_type_id)
	end

end
