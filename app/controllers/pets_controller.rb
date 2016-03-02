class PetsController < ApplicationController
  
  def show
    squarb = Breed.find_by_name("Squarb")
    @random_pet = Pet.new(name: "Barb", 
                          breed_id: squarb.id,
                          max_health: squarb.max_health,
                          health: squarb.max_health,
                          strength: squarb.strength,
                          dexterity: squarb.dexterity,
                          defense: squarb.defense,
                          hunger: 0)
  end

end
