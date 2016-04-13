class Battle < ActiveRecord::Base
  
  has_many :contenders
  has_many :battle_turns

  def challenger
    contenders.where(challenger: true).first
  end

  def opponent
    contenders.where(challenger: false).first
  end

end
