class BreedsController < ApplicationController
  
  def show
    @breed = Breed.find(params[:id])
  end

end
