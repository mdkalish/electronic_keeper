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

  def self.count_tickets_per_user(date = '')
    tickets_per_user = {}
    # binding.pry
    all.each do |u|
      if date.nil? or date.empty? or date == I18n.t('search.all')
        tickets_per_user[u.name] = u.tickets.count
      elsif !date.empty?
        tickets_per_user[u.name] = u.tickets.where("DATE(created_at) = DATE(?)", date).count
      end
    end
    tickets_per_user
  end

end
