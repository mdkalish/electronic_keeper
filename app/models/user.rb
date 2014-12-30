class User < ActiveRecord::Base
  has_many :tickets
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  # before_save :downcase_name
  has_secure_password

  def downcase_name
    name.downcase!
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
