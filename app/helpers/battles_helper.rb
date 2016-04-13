module BattlesHelper

  def self.status battle, user

    if battle.accepted.nil?
      return "challenge pending"
    end

    unless battle.accepted
      return "declined"
    end

    unless battle.finished
      return "ongoing"
    end

    if battle.won
      if user == battle.challenger.user
        return "victorious"
      else
        return "defeated"
      end
    else
      if user == battle.challenger.user
        return "defeated"
      else
        return "victorious"
      end
    end
    return "I don't even know"
    
  end

end
