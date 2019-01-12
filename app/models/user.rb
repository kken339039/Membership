class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users_roles, dependent: :destroy
  has_many :roles, through: :users_roles, source: :role
end
