class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  alias_attribute :pitpoints, :dollaz
 

  has_many :contenders
  has_many :battles, through: :contenders
  has_many :pets, foreign_key: :owner_id

  def battles_with user_id
    battles.joins(:contenders).where(contenders: {user_id: user_id})
  end

  def self.try_login(username, password)
    user = User.find_by_username(username).try(:authenticate, password)
    return user || false
  end

end
