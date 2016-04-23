class PetsController < ApplicationController
  
  def show
    @pet = Pet.find(params[:id])
  end

  def index
    @pets = @current_user.pets
  end

end
