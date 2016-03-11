class Pet < ActiveRecord::Base

	belongs_to :breed

	def hunger		
		total_hunger = self.hunger_base + (((DateTime.now.to_time - self.last_fed.to_time) / 1.hour) * self.breed.hunger_rate).floor
		[total_hunger, 100].min
	end
end
