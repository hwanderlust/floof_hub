class User < ApplicationRecord
  # has_secure_password

  belongs_to :location
  has_many :pets
  has_many :shelters, through: :pets
end
