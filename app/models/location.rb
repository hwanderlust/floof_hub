class Location < ApplicationRecord
  has_many :users
  has_many :shelters
  has_many :pets, through: :shelters

  # Country.named("United States")

  # routes--> get 'filter_units_by_organization' => 'projects#filter_units_by_organization'

  # controller-->
  # def filter_units_by_organization
  #   @filtered_units = Unit.where(organization_id: params[:selected_organization])
  # end

  # views/projects/filter_units_by_organization.js.erb-->
  # $('select#project_unit_id').html('<%= j options_from_collection_for_select(@filtered_units, :id, :name) %>');

  # assets/javascripts/application.js -->
  #   $(function() {
  #     $("select#project_organization_id").on("change", function() {
  #         $.ajax({
  #             url:  "/filter_units_by_organization",
  #             type: "GET",
  #             data: { selected_organization: $("select#project_organization_id").val() }
  #         });
  #     });
  # });

  # views/projects/_form.html.erb -->
  # <%= f.collection_select :unit_id, Unit.all.where(organization_id: :organization_id), :id, :name %>

  # def filter_states_by_country
  #   @filtered_states = Country.named("#{params[:selected_country]}")
  # end

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
