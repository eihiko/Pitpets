class Battle < ActiveRecord::Base
  
  has_many :contenders

  def challenger
    contenders.where(challenger: true).first.user
  end

  def opponent
    contenders.where(challenger: false).first.user
  end

end
