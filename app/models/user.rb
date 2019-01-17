class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :lockable
  attr_accessor :role_id

  has_many :users_roles
  has_many :roles, through: :users_roles

  after_create :set_default_role

  # def is_admin?
  #   roles.find_by(name: 'admin').present?
  # end

  # def is_premium?
  #   roles.find_by(name: 'premium').present?
  # end

  private
  def set_default_role
    self.roles << Role.find_by_name('normal')
  end
end
