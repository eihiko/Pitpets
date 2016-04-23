class Pet < ActiveRecord::Base

	belongs_to :breed
  belongs_to :owner, class_name: :User
  has_many: adopt_pet

  before_create :inherit_stats

	def hunger		
		total_hunger = self.hunger_base + (((DateTime.now.to_time - self.last_fed.to_time) / 1.hour) * self.hunger_rate).floor
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

  def inherit_stats
    breed = Breed.find(breed_id)
    self.max_health = breed.max_health
    self.health = max_health
    self.strength = breed.strength
    self.dexterity = breed.dexterity
    self.defense = breed.defense
    self.hunger_rate = breed.hunger_rate
    self.hunger_base = 0
    self.last_fed = DateTime.now.to_time
  end

end
