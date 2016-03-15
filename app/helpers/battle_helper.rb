module BattleHelper

  def self.status battle

    if battle.accepted.nil?
      return "challenge pending"
    end

    unless battle.accepted
      return "declined"
    end

    unless battle.finished
      return "ongoing"
    end

    unless battle.won
      return "defeated"
    end

    return "victorious"
    
  end

end
