class Game < ActiveRecord::Base

  has_many :game_scores
  
  before_create :gen_guid

  def gen_guid
    self.guid = SecureRandom.uuid
    self.rate = 1
    self.recalculated = DateTime.now
  end

  def quote!
    unless last_calculated < 1.hour
      recalculate!
    end
    return rate
  end

  def last_calculated
    -(recalculated - DateTime.now)
  end

  def recalculate!
    #Average points per second
    average = self.game_scores.sum(:ratio) / self.game_scores.count
    hourly_average = average * 1.hour
    #hourly_average * rate = Config.wage
    self.rate = Config.wage / hourly_average
    self.recalculated = DateTime.now
    save!
  end

end
