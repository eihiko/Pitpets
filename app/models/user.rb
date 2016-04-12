class User < ActiveRecord::Base

  acts_as_messageable

  before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 16 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  alias_attribute :pitpoints, :dollaz

  after_create :create_inventory

  has_many :contenders
  has_many :battles, through: :contenders
  has_many :pets, foreign_key: :owner_id
  belongs_to :inventories

  def name
    return username
  end

  def mailboxer_email object
    return nil
  end

  def battles_with user_id
    battles.joins(:contenders).where(contenders: {user_id: user_id})
  end

  def self.try_login(username, password)
    user = User.find_by_username(username).try(:authenticate, password)
    return user || false
  end

  def create_inventory
    Inventory.create!(owner_id: self.id, owner_type: OwnerType.find_by(name: "player"))
  end

  def inventory
    Inventory.where(owner_id: self.id, owner_type: OwnerType.find_by(name: "player")).first
  end

  def charge(cost)
	if (self.pitpoints < cost)
		return false
	end
	self.pitpoints -= cost
	self.save! 
  end

  def self.dump
    User.all.each do |u|
      puts "#{u.username}, #{u.email}, #{u.password_digest}, #{u.pitpoints}, #{u.guid}, #{u.created_at}"
    end;""
  end

end
