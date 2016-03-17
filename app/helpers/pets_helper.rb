module PetsHelper

  def self.image pet
    helpers.image_tag pet.breed.image_url
  end

  def self.helpers
    ActionController::Base.helpers
  end

end
