class Role < ApplicationRecord
  has_many :user_roles, dependent: :delete_all
  has_many :users, through: :user_roles, source: :user

  validates :name, uniqueness: true
end
