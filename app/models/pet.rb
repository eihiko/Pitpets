class Pet < ActiveRecord::Base

	belongs_to :breed
  belongs_to :owner, class_name: :User, touch: true
  has_many :statuses

  before_create :inherit_stats

	def hunger		
		total_hunger = self.hunger_base + (((DateTime.now.to_time - self.last_fed.to_time) / 1.hour) * self.hunger_rate).floor
		[total_hunger, 100].min
	end

  def health=(value)
    write_attribute(:health, value)
  end

  def health
    h = read_attribute(:health)
    if h > max_health
      h = max_health
      self.health = h
      save!
    end
    return h
  end

	def eat(food_amount)
		self.hunger_base = self.hunger - food_amount
		self.hunger_base = [self.hunger_base, 0].max
		self.last_fed = DateTime.now.to_time
		self.save!
	end

  def dead?
    status_type = StatusType.find_by_name("Dead")
    return true unless statuses.find_by_status_type_id(status_type.id).nil?
    if health <= 0
      Status.transaction do
        statuses.create!(status_type_id: status_type.id)
      end
      return true
    end
    return false
  end

  def kill!
    status_type = StatusType.find_by_name("Dead")
    Status.transaction do
      statuses.create!(status_type_id: status_type.id)
      self.health = 0
      save!
    end
  end

  def captured?
    status_type = StatusType.find_by_name("Captured")
    return !statuses.find_by_status_type_id(status_type.id).nil?
  end

  def remove_status type
    status_type = StatusType.find_by_name(type)
    status = statuses.find_by_status_type_id(status_type.id)
    status.destroy unless status.nil?
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
