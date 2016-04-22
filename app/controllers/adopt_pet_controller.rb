require 'petname'


class AdoptPetController < ApplicationController

	attr_Accessor :breed_id, :username, :pets, :name, :users

	def show
	end

	def initialize (username, breed_id)
		@username = username
		@breed_id = breed_id
		@pets = {}
		@users = {}
	end  

	def load_user
		users_arr = []
		@users.each { |key, value|
		users_arr << "#{value.username} is adopting pets"
		}
		puts users_str =users_arr.join("\n")
	end

	def assign_name
		pn = PetName::Generator.new
		# returns random name consisted of two words and separated with '-'
		pn.generate
	end
 
	def load_pets
		puts "Here are the pets available for adoption: "
		pet_pid = Pet.find( :all, :select => 'breed_id' ).map( &:breed_id )
		@pets = Pet.find( (1..10).map { pet_pid.delete_at( pet_pid.size * rand )}) 	#randomly generates 10 pets
		pets.name.assign_name  #to each?
		pets_arr = [pets]
		@pets.each { |key, value|
		pets_arr << "#{value.name} is a #{value.breed_id}"}
		puts pets_str = pets_arr.join("\n")
    	end

	
	def adopt_pet
		puts "User?"
		load_user
		users_to_adopt = gets.chomp 
	
		puts "Select a Pet: "
		load_pets 
		pet_to_adopt = gets.chomp

		puts "Adopted #{pets[pet_to_adopt]}"
		users[users_to_adopt].pets[pet[pet_to_adopt].name]= pets[pet_to_adopt]
		pets.delete(pet_to_adopt)
		puts "#{users_to_adopt} has adopted #{pet_to_adopt}"
	end	 
end

