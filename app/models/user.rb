class User < ApplicationRecord
  has_secure_password
  belongs_to :location
  has_many :pets
  has_many :shelters, through: :pets
  belongs_to :employer, class_name: "Shelter", optional: true

  accepts_nested_attributes_for :location
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  before_validation { avatar.clear if @delete_avatar }

  validates  :name, {presence: true, length: {minimum: 5, maximum: 70}}
  validates  :age, {presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 16, less_than_or_equal_to: 122 }}
  validates  :dwelling_type, {length: {maximum: 20}}
  validates  :household_members, {presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }}
  validates  :password, {length: {minimum: 6}, allow_nil: true}
  validates  :email_address, {presence: true, length: {minimum: 6, maximum: 64}, uniqueness: true}
  validates :bio, {length: {maximum: 500}}

  def build_location=(params)
    new_location = Location.new(params)
    if new_location.valid?
      new_location.save
    end
    self.location = new_location
  end

  def update_location=(params)
    self.location.street_address = params[:street_address]
    self.location.city = params[:city]
    self.location.state = params[:state]
    self.location.country = params[:country]
    self.location
  end

  def find_shelters
    # Shelter.joins(:location).where(locations: {state: self.location.state})
    Shelter.all.select do |shelter|
      shelter.location.state == self.location.state
    end

  def delete_avatar
    @delete_avatar ||= false
  end

  def delete_avatar=(value)
    @delete_avatar  = !value.to_i.zero?
  end

end
