class Shelter < ApplicationRecord
  has_many :pets
  has_many :users, through: :pets
  belongs_to :location
end
