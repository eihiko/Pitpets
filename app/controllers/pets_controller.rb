class PetsController < ApplicationController
  
  def show
    @pet = Pet.find(params[:id])
  end

  def random_pets
  	if params[:breed_id]
   		 breeds = Breed.where(id: params[:breed_id])
   		 @pet = []
    		breeds.each do |breed|
      		@pet << breed.generate_random_pets(10)
   		 end
	else
    		@pet = nil
 		 end
 		 respond_to do |format|
    		format.html { render action: :index }
  	end

end
