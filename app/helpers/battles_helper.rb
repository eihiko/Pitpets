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

  def capture_options
    s = ""
    s << "<option value='0'>keep them</option>"
    s << "<option value='1'>kill them</option>"
    s << "<option value='2'>release them</option>"
    s.html_safe
  end

  def opponent_options
    s = ""
    User.all.each do |user|
      next if user == @current_user
      s << "<option value='#{user.id}'>#{user.name}</option>"
    end
    s.html_safe
  end

end
