class Location < ApplicationRecord
  has_many :users
  has_many :shelters
  has_many :pets, through: :shelters

  State = Struct.new(:name, :code)
  def self.states
    states_array = Array.new
    state_names = Country.named("United States").subregions.typed("state").map{|s|s.name}
    state_names << "Washington DC"
    state_codes = Country.named("United States").subregions.typed("state").map{|s|s.code}
    state_codes << "DC"
    states_array = state_codes.zip(state_names)
    params = []
    states_array.each do |s|
      params << State.new(s[1], s[0])
    end
    params
  end

  def self.countries
    Country.all.map{|c|c.name}
  end

  def self.cities(state, country_name)
    country = CS.countries.select do |k,v|
      v == country_name
    end
    country = country.keys.first.to_s
    CS.cities(:"#{state}", :"#{country}")
  end

end
