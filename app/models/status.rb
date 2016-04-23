class Status < ActiveRecord::Base

  belongs_to :pet
  belongs_to :status_type
  delegate :name, to: :status_type

end
