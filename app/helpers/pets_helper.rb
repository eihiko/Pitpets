module PetsHelper

  def self.image pet
    helpers.image_tag pet.breed.image_url
  end

  def self.helpers
    ActionController::Base.helpers
  end

  def pet_options
    s = ""
    @current_user.pets.each do |pet|
      s << "<option value='#{pet.id}'>#{pet.name} (#{pet.breed.name})</option>"
    end
    s.html_safe
  end

end
