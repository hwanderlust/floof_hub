class Shelter < ApplicationRecord
  belongs_to :location
  has_many :pets
  has_many :users, through: :pets
  has_many :employees, class_name: "User", foreign_key: "employer_id"
  accepts_nested_attributes_for :location

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  before_validation { avatar.clear if @delete_avatar }

  validates  :name, {presence: true, length: {minimum: 5, maximum: 70}, uniqueness: true}
  validates  :email_address, {presence: true, length: {minimum: 6, maximum: 64},uniqueness: true}
  validates :description, {length: {maximum: 500}}
  validates :telephone_number, {length: {minimum: 10, maximum: 15}}
  validates :website, {length: {minimum: 2, maximum: 255, messsage: "Link Invalid"}}

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

  def delete_avatar
    @delete_avatar ||= false
  end

  def delete_avatar=(value)
    @delete_avatar  = !value.to_i.zero?
  end

end
