class GameScore < ActiveRecord::Base

  belongs_to :game
      
  before_create :calculate_ratio

  def calculate_ratio
    ratio = score / time
  end

end
