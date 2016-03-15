class Conversation < ActiveRecord::Base
  belongs_to :sender, foreign_key: :user_a_id, class_name: :User
  belongs_to :recipient, foreign_key: :user_b_id, class_name: :User

  has_many :messages, dependent: :destroy

  validates_uniqueness_of :user_a_id, scope: :b_id

  scope :between, -> (sender, recipient) do
    where("(conversations.sender = ? AND conversations.recipient =?) OR (conversations.sender = ? AND conversations.recipient =?)", sender, recipient, recipient, sender)
  end

end
