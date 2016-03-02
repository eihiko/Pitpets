# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

purple_hat = ItemType.create(name: "Purple HAT", durability: 5000, image_url: "https://sp.yimg.com/xj/th?id=OIP.Mbac296a6cbc1dcb40a15147ad500f7d5H0&pid=15.1&P=0&w=300&h=300")

heal = EffectType.create(name: "Heal")
burn = EffectType.create(name: "Burn")
freeze = EffectType.create(name: "Freeze")

ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: heal.id, expires: nil)
ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: burn.id, expires: nil)
ItemTypeEffect.create(item_type_id: purple_hat.id, effect_type_id: freeze.id, expires: nil)
