class Config < ActiveRecord::Base

  def self.wage
    self.first.wage
  end

end
