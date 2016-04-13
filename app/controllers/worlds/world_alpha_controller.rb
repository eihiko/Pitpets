class Worlds::WorldAlphaController < ApplicationController
  
  def index
  end

  def food_kitchen
	@dialog = ["You follow some hastily scribbled signs that read \"Fewd Kitchen\", and come across a lovely two-story home. \"Fewd Kitchen\" has been graffitied on most of the surfaces of the house. It makes the home only slightly less lovely."].sample
  end

  def food_kitchen_inside
	last_visit = @current_user.food_kitchen_visits.order("created_at").last
	if (last_visit == nil || last_visit.created_at.to_date != DateTime.current.to_date)
		@dialog = ["You open the fridge, and grab some food."].sample
		visit = FoodKitchenVisit.new(user_id: @current_user.id)
		visit.save!
	else
		@dialog = ["Leave some food for the rest of the starving pets! Only one visit to the Food Kitchen per day!"].sample
	end
  end
end

