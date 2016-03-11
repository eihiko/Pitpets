# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

squarb = Breed.create(name: "Squarb", 
             image_url: "/img/pets/squarb.png", 
             max_health: 100,
             strength: 10,
             dexterity: 5,
             defense: 15,
	     hunger_rate: 4)

Pet.create(name: "Barb", 
		max_health: 100, 
		health: 20, 
		hunger_base: 26, 
		strength: 10, 
		dexterity: 5, 
		defense: 15, 
		breed_id: squarb.id,
		last_fed: DateTime.now)

