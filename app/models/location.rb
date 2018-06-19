class Location < ApplicationRecord
  has_many :users
  has_many :shelters
  has_many :pets, through: :shelters
  def states
    us = Country.named("United States")
    states = us.subregions.typed("state").map{|state|state.code}.count
    states << "DC"
  end
  def countries
    Country.all.map{|c|c.name}
  end

  def self.make(params_hash)
    location = self.new(params_hash)
    if location.valid?
      location.save
    end
    location
  end

end
