class User < ActiveRecord::Base
  before_save { username.downcase! }
  before_save { email.downcase! }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  # Returns the hash digest of the given string.
  def self.digest(string)
    cost = if ActiveModel::SecurePassword.min_cost
             BCrypt::Engine::MIN_COST
           else
             BCrypt::Engine.cost
           end
    BCrypt::Password.create(string, cost: cost)
  end
end
