class TradeRequest < ActiveRecord::Base

	def get_from_user
		User.find(self.from_user)
	end

	def get_to_user
		User.find(self.to_user)
	end

	def get_item_from_user
		self.get_from_user.inventory.find_item(self.item_from_user)
	end

	def get_item_to_user
		self.get_to_user.inventory.find_item(self.item_to_user)
	end

end
