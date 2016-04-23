class Breed < ActiveRecord::Base

	has_many :pets
	
	def generate_random_pets(10)

		unless self.pets.empty?
		self.pets.limit(10).sample
	end

end
