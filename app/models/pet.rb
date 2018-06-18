class Pet < ApplicationRecord
  has_one :user
  belongs_to :shelter
end
