class Shelter < ApplicationRecord
  belongs_to :location
  has_many :pets
  has_many :users, through: :pets
end
