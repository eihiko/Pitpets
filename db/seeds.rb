# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Breed.create(
  name: "Human",
  image_url: "/img/pets/human.png",
  max_health: 50,
  strength: 5,
  dexterity: 15,
  defense: 5,
  hunger_rate: 0
)

Breed.create(
  name: "IncrediblyLargeTickWithLymeDisease",
  image_url: "/img/pets/incrediblyLargeTickWithLymeDisease.png",
  max_health: 10,
  strength: 1,
  dexterity: 5,
  defense: 3,
  hunger_rate: 8
)

squarb = Breed.create(
  name: "Squarb", 
  image_url: "/img/pets/squarb.png", 
  max_health: 100,
  strength: 10,
  dexterity: 5,
  defense: 15,
  hunger_rate: 4
)

heal = EffectType.create(name: "Heal")
burn = EffectType.create(name: "Burn")
freeze = EffectType.create(name: "Freeze")
poison = EffectType.create(name: "Poison")
food = EffectType.create(name: "Food")

diseased_bite = ItemType.create(name: "DiseasedBite", durability: 100, image_url: "/img/items/diseased_bite.png")
ItemTypeEffect.create(item_type_id: diseased_bite.id, effect_type_id: poison.id, modifier1: 3)

# Seed NPC_Shop and Player inventory types
OwnerType.create(name: "player")
OwnerType.create(name: "npc_shop")

# Seed a sample shop and shopkeeper
sk = Shopkeeper.create(first_name: "Lucky", last_name: "McStumpy")
shop = Shop.create(name: "Lucky's Used Weapon Emporium", shopkeeper_id: sk.id)

#Test user accounts
ei = User.create(
  username: "eihiko",
  email: "oeihiko@gmail.com",
  password: "Hackme00",
  password_confirmation: "Hackme00"
)
yo = User.create(
  username: "youko",
  email: "oyouko@gmail.com",
  password: "Hackme00",
  password_confirmation: "Hackme00"
)

tallgrass = User.create(
  username: "tallgrass",
  email: "tallgrass@pitpets.net",
  password: "Hackme00",
  password_confirmation: "Hackme00"
)
tallgrass.pets.first.destroy

Pet.create(
  name: "Barb", 
	breed_id: squarb.id,
	owner_id: ei.id
)

Pet.create(
  name: "Henri", 
	breed_id: squarb.id,
	owner_id: yo.id
)

Item.create_from_item_type(diseased_bite.id, {inventory_id: tallgrass.inventory.id})
Item.create_from_item_type(diseased_bite.id, {inventory_id: tallgrass.inventory.id})

purple_hat = ItemType.create(name: "Purple HAT", durability: 5000, image_url: "https://sp.yimg.com/xj/th?id=OIP.Mbac296a6cbc1dcb40a15147ad500f7d5H0&pid=15.1&P=0&w=300&h=300")

ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

item1 = Item.create(item_type_id: purple_hat.id, durability: 5, expires: nil, inventory_id: shop.inventory.id)
item2 = Item.create(item_type_id: purple_hat.id, durability: 4000, expires: nil, inventory_id: shop.inventory.id)

Item.create_from_item_type(purple_hat.id, {inventory_id: ei.inventory.id})
Item.create_from_item_type(purple_hat.id, {inventory_id: ei.inventory.id})
Item.create_from_item_type(purple_hat.id, {inventory_id: yo.inventory.id})
Item.create_from_item_type(purple_hat.id, {inventory_id: yo.inventory.id})

ItemEffect.create(item_id: item1.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: poison.id, modifier1: 2, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: food.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

ItemEffect.create(item_id: item2.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item2.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item2.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

