class Pet < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shelter

  validates  :name, {presence: true, length: {minimum: 2, maximum: 70}}
  validates  :age, {presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 122 }}
  validates :bio, {length: {maximum: 500}}
  validates :pet_type, {presence: true, length: {minimum: 3, maximum: 64}}
  validates :breed, {presence: true, length: {minimum: 3, maximum: 64}}
  validates :temperament, {presence: true, length: {minimum: 3, maximum: 64}}

end
