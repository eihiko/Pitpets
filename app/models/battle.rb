class Battle < ActiveRecord::Base
  
  has_many :contenders
  has_many :battle_turns

  def challenger
    contenders.where(challenger: true).first
  end

  def opponent
    contenders.where(challenger: false).first
  end

  def contender? user
    return challenger?(user) || opponent?(user)
  end

  def challenger? user
    return user == challenger.user
  end

  def opponent? user
    return user == opponent.user
  end

end
