class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles, dependent: :delete_all
  has_many :roles, through: :user_roles, source: :role

  after_create :set_default_role

  def is_admin?
    roles.find_by(name: 'admin').present?
  end

  def is_premium?
    roles.find_by(name: 'premium').present?
  end

  private
  def set_default_role
    self.roles << Role.find_by_name('normal')
  end
end
