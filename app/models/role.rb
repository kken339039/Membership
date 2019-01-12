class Role < ApplicationRecord
  has_many :users, through: :users_roles
  has_many :users_roles, dependent: :destroy, source: :user

  belongs_to :resource, :polymorphic => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true
  validates :name, uniqueness: true

  scopify
end
