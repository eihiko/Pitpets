class Pet < ActiveRecord::Base

	belongs_to :breed
  belongs_to :owner, class_name: :User

	def hunger		
		total_hunger = self.hunger_base + (((DateTime.now.to_time - self.last_fed.to_time) / 1.hour) * self.breed.hunger_rate).floor
		[total_hunger, 100].min
	end

	def eat(food_amount)
		self.hunger_base = self.hunger - food_amount
		self.hunger_base = [self.hunger_base, 0].max
		self.last_fed = DateTime.now.to_time
		self.save!
	end

  def dead?
    return health <= 0
  end

end
