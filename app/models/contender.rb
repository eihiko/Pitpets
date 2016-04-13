class Contender < ActiveRecord::Base

  belongs_to :battle
  belongs_to :user
  belongs_to :pet

end
