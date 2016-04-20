class Worlds::WorldAlphaController < ApplicationController
  
  def index
  end

  def food_kitchen
	@dialog = ["You follow some hastily scribbled signs that read \"Fewd Kitchen\", and come across a lovely two-story home. \"Fewd Kitchen\" has been graffitied on most of the surfaces of the house. It makes the home only slightly less lovely."].sample
  end

  def food_kitchen_inside
	last_visit = @current_user.food_kitchen_visits.order("created_at").last
	@food_item = nil
	if (last_visit.nil? || last_visit.created_at.to_date != DateTime.current.to_date)
		@dialog = ["You open the fridge, and grab some food."].sample
		food_type = [ItemType.find_by_name("Tupperware of Leftovers"), ItemType.find_by_name("Tommy's Lunch"), ItemType.find_by_name("Larry's Lunch")].sample
		@food_item = Item.create_from_item_type(food_type)
		@current_user.inventory.add(@food_item.id)
		visit = FoodKitchenVisit.new(user_id: @current_user.id)
		visit.save!
	else
		@dialog = ["Leave some food for the rest of the starving pets! Only one visit to the Food Kitchen per day!", "A man is sobbing on the floor in front of the fridge. You think it best not to disturb him, and quickly back out of the room before he decides to talk to you."].sample
	end
  end
end

