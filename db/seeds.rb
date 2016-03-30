# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Seed NPC_Shop and Player inventory types
OwnerType.create(name: "player")
OwnerType.create(name: "npc_shop")

# Seed a sample shop and shopkeeper
sk = Shopkeeper.create(first_name: "Lucky", last_name: "McStumpy")
shop = Shop.create(name: "Lucky's Used Weapon Emporium", shopkeeper_id: sk.id)

squarb = Breed.create(name: "Squarb", 
             image_url: "/img/pets/squarb.png", 
             max_health: 100,
             strength: 10,
             dexterity: 5,
             defense: 15,
             hunger_rate: 4
            )

Pet.create(name: "Barb", 
		max_health: 100, 
		health: 20, 
		hunger_base: 26, 
		strength: 10, 
		dexterity: 5, 
		defense: 15, 
		breed_id: squarb.id,
		last_fed: DateTime.now,
		owner_id: 1)

purple_hat = ItemType.create(name: "Purple HAT", durability: 5000, image_url: "https://sp.yimg.com/xj/th?id=OIP.Mbac296a6cbc1dcb40a15147ad500f7d5H0&pid=15.1&P=0&w=300&h=300")

heal = EffectType.create(name: "Heal")
burn = EffectType.create(name: "Burn")
freeze = EffectType.create(name: "Freeze")
poison = EffectType.create(name: "Poison")
food = EffectType.create(name: "Food")

ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

item1 = Item.create(item_type_id: purple_hat.id, durability: 5, expires: nil, inventory_id: shop.inventory.id)
item2 = Item.create(item_type_id: purple_hat.id, durability: 4000, expires: nil, inventory_id: shop.inventory.id)

ItemEffect.create(item_id: item1.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: poison.id, modifier1: 2, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item1.id, effect_type_id: food.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

ItemEffect.create(item_id: item2.id, effect_type_id: heal.id, modifier1: 50, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item2.id, effect_type_id: burn.id, modifier1: 100, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)
ItemEffect.create(item_id: item2.id, effect_type_id: freeze.id, modifier1: 500, modifier2: nil, modifier3: nil, time_modifier: nil, text_modifier: nil)

