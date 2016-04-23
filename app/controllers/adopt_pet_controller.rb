require 'petname'


class AdoptPetController < ApplicationController

	@pets.each{ |pet| pet.adopt_pet.create(users: users)}

	def assign_name
		pn = PetName::Generator.new
		# returns random name consisted of two words and separated with '-'
		pn.generate
	end
 
end

