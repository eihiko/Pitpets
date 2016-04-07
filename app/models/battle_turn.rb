class BattleTurn < ActiveRecord::Base
  
  belongs_to :battle
  belongs_to :contender
  belongs_to :offensive_item, class_name: :Item
  belongs_to :defensive_item, class_name: :Item

end
